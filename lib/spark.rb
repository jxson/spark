module Spark 
	module Mixin
		def random_paragraph(count=5,min_sentences=1,max_sentences=5,min_words=3,max_words=10)
			sentences = (1..count).inject([]) {|a,_ignore| a << random_sentence(rand(max_sentences)+min_sentences+1,min_words,max_words)}
			sentences.join('.  ')
		end

		def random_sentence(count=5,min_words=3,max_words=10)
			words = (1..count).inject([]) {|a,_ignore| a << random_word(rand(max_words-min_words+1)+min_words)}
			words.join(' ')
		end

		def random_word(length=6)
		  chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789'
		  text = ''
		  length.downto(1) { |i| text << chars[rand(chars.length - 1)].chr }
		  text
		end

		def random_email
			"#{random_word}@#{random_word}.#{['com','net','org'][rand(3)]}"
		end

		def random_url
			"http://www.google.com/search?source=ig&hl=en&rlz=&=&q=#{random_word}&btnG=Google+Search"
		end
	end
end