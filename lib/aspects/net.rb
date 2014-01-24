module Recipe
  def self.net
    'ruby -e "require \'net/http\'; puts Net::HTTP.new(\'icanhazip.com\').request(Net::HTTP::Get.new(\'/\', {\'User-Agent\'=>\'curl\'})).body"'
  end
end
