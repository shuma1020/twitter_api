module ApplicationHelper
  def get_twitter_card_info(post)
    twitter_card = {}
    if post.present?
      if post.id.present?
        twitter_card[:url] = "https://iamrecruitme.herokuapp.com/posts/#{post.id}"
        twitter_card[:image] = "https://s3-ap-northeast-1.amazonaws.com/i-am-production/images/#{post.id}.png"
      else
        p "kkkk"
        twitter_card[:url] = 'https://iamrecruitme.herokuapp.com/'
        twitter_card[:image] = "https://raw.githubusercontent.com/shuma1020/twitter-api/master/app/assets/images/top.png"
      end
    else
      p "kkkk"
      twitter_card[:url] = 'https://iamrecruitme.herokuapp.com/'
      twitter_card[:image] = "https://raw.githubusercontent.com/shuma1020/twitter-api/master/app/assets/images/top.png"
    end
    twitter_card[:title] = "画像下に表示されるタイトル"
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:description] = '画像下に表示される説明文'
    twitter_card
  end
end