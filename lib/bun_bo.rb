require "bun_bo/version"
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

      FileUtils.mkdir_p(test_folder)
      test_path.write('')
    else
      "File does not exists"
    end
  end
end
