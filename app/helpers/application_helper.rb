module ApplicationHelper
  def get_twitter_card_info(post)
    twitter_card = {}
    if post.present?
      if post.id.present?
        twitter_card[:url] = "https://iamrecruitme.herokuapp.com/posts/#{post.id}"
        twitter_card[:image] = "https://s3-ap-northeast-1.amazonaws.com/i-am-production/images/#{post.id}.png"
      else
        twitter_card[:url] = 'https://iamrecruitme.herokuapp.com/'
        <meta property="og:image" content=Rails.root.join("app/assets/images/top.png") />
      end
    else
      twitter_card[:url] = 'https://iamrecruitme.herokuapp.com/'
      <meta property="og:image" content=Rails.root.join("app/assets/images/top.png") />
    end
    twitter_card[:title] = "雰囲気で繋がる"
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:description] = '自分の雰囲気をシェアしてTwitterで新たな出会いを応援するサービスです'
    twitter_card
  end
end