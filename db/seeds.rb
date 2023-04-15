# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'yk@mycar.com',
  password: '111111'
)

Maker.create!([
                { maker_name: "TOYOTA" },
                { maker_name: "NISSAN" },
                { maker_name: "HONDA" },
                { maker_name: "MAZDA" },
                { maker_name: "SUBARU" },
                { maker_name: "MITSUBISHI" },
                { maker_name: "SUZUKI" },
                { maker_name: "その他" },
                { maker_name: "なし" }
              ])

AeroMaker.create!([
                    { aero_maker_name: "admiration" },
                    { aero_maker_name: "AIMGAIN" },
                    { aero_maker_name: "AMS" },
                    { aero_maker_name: "ARTISAN SPIRITS" },
                    { aero_maker_name: "TOMS" },
                    { aero_maker_name: "TRD" },
                    { aero_maker_name: "CRAVE" },
                    { aero_maker_name: "その他" },
                    { aero_maker_name: "なし" }
                  ])

Tag.create!([
              { tag_name: "日本車" },
              { tag_name: "外車" },
              { tag_name: "スポーツカー" },
              { tag_name: "コンパクトカー" },
              { tag_name: "SUV" },
              { tag_name: "ミニバン" },
              { tag_name: "エアロ装備有" },
              { tag_name: "FF" },
              { tag_name: "FR" },
              { tag_name: "4WD" }
            ])
