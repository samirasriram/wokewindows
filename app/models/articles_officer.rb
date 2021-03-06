class ArticlesOfficer < ApplicationRecord
  enum status: {
    added: "added",
    rejected: "rejected",
    confirmed: "confirmed"
  }

  belongs_to :article
  belongs_to :officer

  counter_culture :officer, column_name: proc { |ao| ao.visible? ? 'articles_officers_count' : nil }, column_names: {["status in ('added', 'confirmed')"] => 'articles_officers_count'}

  def excerpt(size = 40)
    re = officer.article_regexp
    match = re.match(article.body)
    return nil unless match
    start = match.begin(0)
    finish = match.end(0)
    article.body[[start - size, 0].max .. (finish + size)]
  end

  def visible?
    added? || confirmed?
  end
end
