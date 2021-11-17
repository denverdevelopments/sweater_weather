require 'rails_helper'

RSpec.describe Images do
  it "exists and has attributes", :vcr do
    input = [
      {
          "id": "11mvtrRdFDzzI",
          "created_at": "2021-10-17T17:49:50-04:00",
          "updated_at": "2021-11-16T06:32:40-05:00",
          "width": 4160,
          "height": 5200,
          "color": "#f3f3f3",
          "blur_hash": "LxG[yYIAIUjZ~qIUM{WB%gM{R%WB",
          "description": "Community in Denver.",
          "urls": {
              "raw": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1",
              "full": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1&q=85"
          },
          "topic_submissions": {
              "current-events": {
                  "status": "rejected"
              }
          },
          "user": {
              "id": "116fM0nTrpvTI",
              "updated_at": "2021-11-16T15:57:53-05:00",
              "username": "dillydallying",
              "name": "Dillon Wanner",
              "first_name": "Dillon",
              "last_name": "Wanner",
              "portfolio_url": "https://dillydally.myportfolio.com",
              "bio": "Artist, Photographer, cinematographer living in Denver, Co. \r\nMy photos are a small glimpse of what I’m feeling or that perspective at that time. Trying to communicate that with other humans. I love you.",
              "location": "Denver Colorado",
              "links": {
                  "self": "https://api.unsplash.com/users/dillydallying",
                  "html": "https://unsplash.com/@dillydallying",
                  "photos": "https://api.unsplash.com/users/dillydallying/photos",
                  "likes": "https://api.unsplash.com/users/dillydallying/likes",
                  "portfolio": "https://api.unsplash.com/users/dillydallying/portfolio"
              },
              "instagram_username": "1Dillydally.ing",
              "total_collections": 0
          }
      },

      {
          "id": "22mvtrRdFDzzI",
          "created_at": "2021-10-17T17:49:50-04:00",
          "updated_at": "2021-11-16T06:32:40-05:00",
          "width": 4160,
          "height": 5200,
          "color": "#f3f3f3",
          "blur_hash": "LxG[yYIAIUjZ~qIUM{WB%gM{R%WB",
          "description": "Community in Denver.",
          "urls": {
              "raw": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1",
              "full": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1&q=85"
          },
          "topic_submissions": {
              "current-events": {
                  "status": "rejected"
              }
          },
          "user": {
              "id": "226fM0nTrpvTI",
              "updated_at": "2021-11-16T15:57:53-05:00",
              "username": "dillydallying",
              "name": "Dillon Wanner",
              "first_name": "Dillon",
              "last_name": "Wanner",
              "portfolio_url": "https://dillydally.myportfolio.com",
              "bio": "Artist, Photographer, cinematographer living in Denver, Co. \r\nMy photos are a small glimpse of what I’m feeling or that perspective at that time. Trying to communicate that with other humans. I love you.",
              "location": "Denver Colorado",
              "links": {
                  "self": "https://api.unsplash.com/users/dillydallying",
                  "html": "https://unsplash.com/@dillydallying",
                  "photos": "https://api.unsplash.com/users/dillydallying/photos",
                  "likes": "https://api.unsplash.com/users/dillydallying/likes",
                  "portfolio": "https://api.unsplash.com/users/dillydallying/portfolio"
              },
              "instagram_username": "2Dillydally.ing",
              "total_collections": 0
          }
      },

      {
          "id": "33mvtrRdFDzzI",
          "created_at": "2021-10-17T17:49:50-04:00",
          "updated_at": "2021-11-16T06:32:40-05:00",
          "width": 4160,
          "height": 5200,
          "color": "#f3f3f3",
          "blur_hash": "LxG[yYIAIUjZ~qIUM{WB%gM{R%WB",
          "description": "Community in Denver.",
          "urls": {
              "raw": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1",
              "full": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1&q=85"
          },
          "topic_submissions": {
              "current-events": {
                  "status": "rejected"
              }
          },
          "user": {
              "id": "336fM0nTrpvTI",
              "updated_at": "2021-11-16T15:57:53-05:00",
              "username": "dillydallying",
              "name": "Dillon Wanner",
              "first_name": "Dillon",
              "last_name": "Wanner",
              "portfolio_url": "https://dillydally.myportfolio.com",
              "bio": "Artist, Photographer, cinematographer living in Denver, Co. \r\nMy photos are a small glimpse of what I’m feeling or that perspective at that time. Trying to communicate that with other humans. I love you.",
              "location": "Denver Colorado",
              "links": {
                  "self": "https://api.unsplash.com/users/dillydallying",
                  "html": "https://unsplash.com/@dillydallying",
                  "photos": "https://api.unsplash.com/users/dillydallying/photos",
                  "likes": "https://api.unsplash.com/users/dillydallying/likes",
                  "portfolio": "https://api.unsplash.com/users/dillydallying/portfolio"
              },
              "instagram_username": "3Dillydally.ing",
              "total_collections": 0
          }
      },

      {
          "id": "44mvtrRdFDzzI",
          "created_at": "2021-10-17T17:49:50-04:00",
          "updated_at": "2021-11-16T06:32:40-05:00",
          "width": 4160,
          "height": 5200,
          "color": "#f3f3f3",
          "blur_hash": "LxG[yYIAIUjZ~qIUM{WB%gM{R%WB",
          "description": "Community in Denver.",
          "urls": {
              "raw": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1",
              "full": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1&q=85"
          },
          "topic_submissions": {
              "current-events": {
                  "status": "rejected"
              }
          },
          "user": {
              "id": "446fM0nTrpvTI",
              "updated_at": "2021-11-16T15:57:53-05:00",
              "username": "dillydallying",
              "name": "Dillon Wanner",
              "first_name": "Dillon",
              "last_name": "Wanner",
              "portfolio_url": "https://dillydally.myportfolio.com",
              "bio": "Artist, Photographer, cinematographer living in Denver, Co. \r\nMy photos are a small glimpse of what I’m feeling or that perspective at that time. Trying to communicate that with other humans. I love you.",
              "location": "Denver Colorado",
              "links": {
                  "self": "https://api.unsplash.com/users/dillydallying",
                  "html": "https://unsplash.com/@dillydallying",
                  "photos": "https://api.unsplash.com/users/dillydallying/photos",
                  "likes": "https://api.unsplash.com/users/dillydallying/likes",
                  "portfolio": "https://api.unsplash.com/users/dillydallying/portfolio"
              },
              "instagram_username": "4Dillydally.ing",
              "total_collections": 0
          }
      },

      {
          "id": "55mvtrRdFDzzI",
          "created_at": "2021-10-17T17:49:50-04:00",
          "updated_at": "2021-11-16T06:32:40-05:00",
          "width": 4160,
          "height": 5200,
          "color": "#f3f3f3",
          "blur_hash": "LxG[yYIAIUjZ~qIUM{WB%gM{R%WB",
          "description": "Community in Denver.",
          "urls": {
              "raw": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1",
              "full": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1&q=85"
          },
          "topic_submissions": {
              "current-events": {
                  "status": "rejected"
              }
          },
          "user": {
              "id": "556fM0nTrpvTI",
              "updated_at": "2021-11-16T15:57:53-05:00",
              "username": "dillydallying",
              "name": "Dillon Wanner",
              "first_name": "Dillon",
              "last_name": "Wanner",
              "portfolio_url": "https://dillydally.myportfolio.com",
              "bio": "Artist, Photographer, cinematographer living in Denver, Co. \r\nMy photos are a small glimpse of what I’m feeling or that perspective at that time. Trying to communicate that with other humans. I love you.",
              "location": "Denver Colorado",
              "links": {
                  "self": "https://api.unsplash.com/users/dillydallying",
                  "html": "https://unsplash.com/@dillydallying",
                  "photos": "https://api.unsplash.com/users/dillydallying/photos",
                  "likes": "https://api.unsplash.com/users/dillydallying/likes",
                  "portfolio": "https://api.unsplash.com/users/dillydallying/portfolio"
              },
              "instagram_username": "5Dillydally.ing",
              "total_collections": 0
          }
      },

      {
          "id": "66mvtrRdFDzzI",
          "created_at": "2021-10-17T17:49:50-04:00",
          "updated_at": "2021-11-16T06:32:40-05:00",
          "width": 4160,
          "height": 5200,
          "color": "#f3f3f3",
          "blur_hash": "LxG[yYIAIUjZ~qIUM{WB%gM{R%WB",
          "description": "Community in Denver.",
          "urls": {
              "raw": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1",
              "full": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNzYyMTB8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkNjb3xlbnwwfHx8fDE2MzcxMjcwMzk&ixlib=rb-1.2.1&q=85"
          },
          "topic_submissions": {
              "current-events": {
                  "status": "rejected"
              }
          },
          "user": {
              "id": "666fM0nTrpvTI",
              "updated_at": "2021-11-16T15:57:53-05:00",
              "username": "dillydallying",
              "name": "Dillon Wanner",
              "first_name": "Dillon",
              "last_name": "Wanner",
              "portfolio_url": "https://dillydally.myportfolio.com",
              "bio": "Artist, Photographer, cinematographer living in Denver, Co. \r\nMy photos are a small glimpse of what I’m feeling or that perspective at that time. Trying to communicate that with other humans. I love you.",
              "location": "Denver Colorado",
              "links": {
                  "self": "https://api.unsplash.com/users/dillydallying",
                  "html": "https://unsplash.com/@dillydallying",
                  "photos": "https://api.unsplash.com/users/dillydallying/photos",
                  "likes": "https://api.unsplash.com/users/dillydallying/likes",
                  "portfolio": "https://api.unsplash.com/users/dillydallying/portfolio"
              },
              "instagram_username": "6Dillydally.ing",
              "total_collections": 0
          }
      }
    ]

    pics = Images.new(input)

    expect(pics).to be_a(Images)
    expect(pics.id).to eq(nil)
    expect(pics.type).to eq("image")
    expect(pics.top_five).to be_a(Array)
    expect(pics.top_five.size).to eq(5)

    expect(pics.top_five.first).to be_a(Hash)
    expect(pics.top_five.first).to have_key :creator
    expect(pics.top_five.first).to have_key :unsplash_profile
    expect(pics.top_five.first).to have_key :location
    expect(pics.top_five.first).to have_key :pic_url
    expect(pics.top_five.first).to have_key :source
  end
end
