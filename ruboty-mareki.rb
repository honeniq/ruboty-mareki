require 'ruboty'
require 'mareki'

module Ruboty
  module Handlers
    class Mareki < Base
      on(
        /mareki (?<year>.+)/,
        name: 'mareki',
        description: 'Translate A.D. to Mareki(魔暦)'
      )

      on(
        /akumaeto (?<year>.+)/,
        name: 'akumaeto',
        description: 'Answer Akuma-Eto(悪魔干支)'
      )

      def mareki(message)
        year = Date.new(message.match_data[1].to_i)
        message.reply("西暦" + year.year.to_s + "年は、魔暦" + \
                      year.mareki_year.to_s + "年です。")
      end

      def akumaeto(message)
        year = Date.new(message.match_data[1].to_i)
        message.reply("西暦" + year.year.to_s + "年の悪魔干支は、" + \
                      year.mareki_eto + "です。")
      end
    end
  end
end
