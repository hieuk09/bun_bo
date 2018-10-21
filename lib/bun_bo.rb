require "bun_bo/version"
require "bun_bo/errors/file_not_found"
require "bun_bo/errors/file_existed"
require "bun_bo/content_generator"
require 'fileutils'

class BunBo
  def run(input_path)
    input_path = Pathname.new(input_path)

    if input_path.file?
      folder_path, file_name = input_path.split
      extension = file_name.extname
      base_name = file_name.basename(extension)

      test_folder = folder_path.sub(/^(app|lib)/, 'spec')
      test_path = test_folder.join("#{base_name}_spec").sub_ext(".rb")

      if !test_path.exist?
        FileUtils.mkdir_p(test_folder)
        generator = ContentGenerator.new(Pathname.pwd)
        test_path.write(generator.generate)
      else
        raise FileExisted, test_path
      end
    else
      raise FileNotFound
    end
  end
end
