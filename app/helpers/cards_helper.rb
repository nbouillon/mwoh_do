module CardsHelper
	def image_for(card)
    	img_name = "/assets/#{card.name}.jpg"
   		image_tag(img_name, alt: card.name, size: "160x200")
  	end
end
