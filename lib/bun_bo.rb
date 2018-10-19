require "bun_bo/version"

class BunBo
  def run(input_path)
    if File.file?(input_path)
      folder_path, file_name = File.split(input_path)
      extension = File.extname(file_name)
      base_name = File.basename(file_name, extension)

      test_folder = File.join('spec', folder_path)
      test_path = File.join(test_folder, "#{base_name}_spec#{extension}")

      FileUtils.mkdir_p(test_folder)
      File.write(test_path, '')
    else
      puts "File does not exists"
    end
  end
end
