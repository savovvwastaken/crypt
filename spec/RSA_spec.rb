describe RSA do 
	rsa = RSA.new(0,0,0)
	array = rsa.new_key
	rsa = RSA.new(array[0], array[1], array[2])
	str = "test4e"

	context "Given message" do 
		it "Encrypts and decrypts it" do 
			crypted = rsa.encrypt(str)
			expect(rsa.decrypt(crypted)).to eq str
		end
	end
end
