# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Profile.destroy_all
admin=Admin.find_or_create_by(:email=>"admin@admin.com")
admin.password="123456789"
admin.save

p "Admin Created"

#++++++++++++++++++++++++++++++++++++Change designation name from all profile +++++++++++++++

Profile.where(:designation => "Naib-Tahsildar" ).each do|p|
	p.designation = "Naib Tahsildar"
	p.save
end
User.where(:designation => "Naib-Tahsildar").each do|p|
	p.designation = "Naib Tahsildar"
	p.save
end

#++++++++++++++++++++++++++++++Designation+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		
				Designation.find_or_create_by(:name=>"Dy.Collector")
				Designation.find_or_create_by(:name=>"Additional Collector")
				Designation.find_or_create_by(:name=>"Dy.Collector")
				Designation.find_or_create_by(:name=>"Tahsildar")
				Designation.find_or_create_by(:name=>"IAS(MCS)")
				Designation.find_or_create_by(:name=>"Others")
	
p "Designation Created"

##################################Disrict And Taluka#########################################
p "Taluka and Disrict Started"

d=District.find_or_create_by(:name=>"Ahmednagar")
t=Taluka.find_or_create_by(:name=>"Shevgaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Pathardi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Parner")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sangamner")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kopargaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Akole")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shrirampur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shrirampur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Rahata")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Rahuri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shrigonda")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Karjat")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Jamkhed")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Akola")
t=Taluka.find_or_create_by(:name=>"Akot")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Telhara")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Balapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Patur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Murtajapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Barshitakli")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Amravati")
t=Taluka.find_or_create_by(:name=>"Bhatukali")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Nandgaon Khandeshwar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Dharni")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chikhaldara")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Achalpur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chandurbazar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Morshi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Warud")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Daryapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Anjangaon-Surji")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chandur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Dhamangaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Tiosa")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Aurangabad")
t=Taluka.find_or_create_by(:name=>"Kannad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Soegaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sillod")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Phulambri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Khuldabad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Vaijapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Gangapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Paithan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Beed")
t=Taluka.find_or_create_by(:name=>"Ashti")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Patoda")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shirur Kasar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Georai")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Manjalgaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Wadwani")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kaij")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Dharur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Parli")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ambejogai")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Bhandara")
t=Taluka.find_or_create_by(:name=>"Bhandara")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Pauni")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mohadi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sakoli")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Lakhni")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Lakhandur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Buldhana")
t=Taluka.find_or_create_by(:name=>"Chikhli")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Deulgaon Raja")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Jalgaon Jamod")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sangrampur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Malkapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Motala")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Nandura")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Khamgaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shegaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mehkar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sindkhed Raja")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Lonar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Chandrapur")
t=Taluka.find_or_create_by(:name=>"Saoli")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mul")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ballarpur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Pombhurna")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Gondpimpri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Warora")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chimur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bhadravati")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Brahmapuri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Nagbhid")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sindewahi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Rajura")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Korpana")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Jivati")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Dhule")
t=Taluka.find_or_create_by(:name=>"Sakri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sindkheda")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shirpur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Gadchiroli")
t=Taluka.find_or_create_by(:name=>"Dhanora")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chamorshi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mulchera")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Desaiganj(Vadsa)")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Armori")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kurkheda")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Korchi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Aheri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Etapalli")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bhamragad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sironcha")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Gondia")
t=Taluka.find_or_create_by(:name=>"Tirora")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Goregaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Arjuni Morgavan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Amgaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Salekasa")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sadak Arjuni")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Deori")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Hingoli")
t=Taluka.find_or_create_by(:name=>"Sengaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kalamnuri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Basmath")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Aundha Nagnath")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Jalgaon")
t=Taluka.find_or_create_by(:name=>"Jamner")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Erandol")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Dharangaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bhusawal")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Raver")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Muktainagar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bodwad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Yawal")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Amalner")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Parola")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chopda")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Pachora")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bhadgaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chalisgaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Jalna")
t=Taluka.find_or_create_by(:name=>"Bhokardan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Jafrabad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Badnapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ambad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ghansawangi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Partur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mantha")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Kolhapur")
t=Taluka.find_or_create_by(:name=>"Panhala")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shahuwadi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kagal")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Hatkanangale")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shirol")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Radhanagari")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Gaganbawada")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bhudargad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Gadhinglaj")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chandgad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ajra")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Latur")
t=Taluka.find_or_create_by(:name=>"Renapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ahmadpur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Jalkot")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chakur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shirur Anantpal")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ausa")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Nilanga")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Deoni")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Udgir")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Mumbai")
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Mumbai Suburban" )
t=Taluka.find_or_create_by(:name=>"Kurla")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Andheri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Borivali")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"NA")
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Nagpur")
t=Taluka.find_or_create_by(:name=>"Nagpur Urban")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Nagpur Rural")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kamptee")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Hingna")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Katol")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Narkhed")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Savner")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kalameshwar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ramtek")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mouda")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Parseoni")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Umred")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kuhi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bhiwapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Nanded")
t=Taluka.find_or_create_by(:name=>"Ardhapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mudkhed")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bhokar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Umri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Loha")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kandhar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kinwat")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Himayatnagar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Hadgaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mahur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Deglur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mukhed")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Dharmabad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Biloli")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Naigaon (Khairgaon)")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Nandurbar")
t=Taluka.find_or_create_by(:name=>"Navapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shahada")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Talode")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Akkalkuwa")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Akrani")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Nashik")
t=Taluka.find_or_create_by(:name=>"Igatpuri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Igatpuri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Peint")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Trimbakeshwar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kalwan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Deola")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Surgana")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Baglan Satana")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Malegaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Nandgaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chandwad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Niphad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sinnar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Yeola")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Osmanabad")
t=Taluka.find_or_create_by(:name=>"Tuljapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Lohara")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Umarga")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bhum")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Paranda")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Washi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kalamb")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Parbhani")
t=Taluka.find_or_create_by(:name=>"Sonpeth")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Gangakhed")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Paalam")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Purna")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sailu")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Jintur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Manwath")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Pathri")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Pune")
t=Taluka.find_or_create_by(:name=>"Pune City")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Haveli")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Khed")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Junnar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ambegaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Maval")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mulshi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shirur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Purandhar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Velhe")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bhor")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Baramati")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Indapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Daund")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Raigad")
t=Taluka.find_or_create_by(:name=>"Alibag")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Murud")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Panvel")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Uran")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Karjat")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Khalapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mangaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Tala")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Roha")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sudhagad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mahad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Poladpur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shrivardhan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mhasla")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Ratnagiri")
t=Taluka.find_or_create_by(:name=>"Sangameshwar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Lanja")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Rajapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Chiplun")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Guhagar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Dapoli")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mandangad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Khed")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Sangli")
t=Taluka.find_or_create_by(:name=>"Miraj")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kavathe Mahankal")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Tasgaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Jat")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Walwa Islampur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shirala")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Khanapur Vita")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Atpadi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Palus")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kadegaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Satara")
t=Taluka.find_or_create_by(:name=>"Koregaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Wai")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mahabaleshwar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Khandala")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Phaltan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Maan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Khatav")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Patan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Karad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Satara")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Sindhudurg")
t=Taluka.find_or_create_by(:name=>"Vaibhavwadi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Malwan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Malwan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Vengurla")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kudal")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Dodamarg")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Devgad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Solapur")
t=Taluka.find_or_create_by(:name=>"Solapur North")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Solapur South")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Akkalkot")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Barshi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Madha")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Karmala")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mohol")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Pandharpur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Malshiras")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Sangole")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mangalvedhe")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Thane")
t=Taluka.find_or_create_by(:name=>"Kalyan")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Murbad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Dahanu")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Palghar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Talasari")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Jawhar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mokhada")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Vada")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Vikramgad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Vasai")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Bhiwandi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Shahapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ulhasnagar")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ambarnath")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Wardha")
t=Taluka.find_or_create_by(:name=>"Deoli")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Seloo")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Arvi")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ashti")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Karanja")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Hinganghat")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Samudrapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Washim")
t=Taluka.find_or_create_by(:name=>"Malegaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Risod")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mangrulpir")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Karanja")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Manora")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")




d=District.find_or_create_by(:name=>"Yavatmal")
t=Taluka.find_or_create_by(:name=>"Arni")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Babhulgaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kalamb")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Darwha")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Digras")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ner")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Pusad")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Umarkhed")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Mahagaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Kelapur")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ralegaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Ghatanji")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Wani")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Maregaon")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:name=>"Zari Jamani")
t.district_id=d.id
t.save
t=Taluka.find_or_create_by(:district_id=>d.id, :name=>"NA")
