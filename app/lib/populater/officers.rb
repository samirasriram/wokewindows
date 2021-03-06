# roll up some values from associations into Officer
class Populater::Officers
  LAST_YEAR = 2019

  def self.populate
    query = Officer.includes(:compensations, :complaints)
    query.find_in_batches do |group|
      Officer.transaction do
        group.each do |officer|
          populate_officer(officer)
        end
      end
    end
  end

  private
  def self.populate_officer(officer)
    latest_comp = officer.compensations.max_by(&:year)
    if latest_comp
      officer.title = latest_comp.title
      officer.postal = latest_comp.postal
    end

    last_year_comp = officer.compensations.find { |c| c.year == LAST_YEAR }
    if last_year_comp
      officer.regular = last_year_comp.regular
      officer.retro = last_year_comp.retro
      officer.other = last_year_comp.other
      officer.overtime = last_year_comp.overtime
      officer.injured = last_year_comp.injured
      officer.detail = last_year_comp.detail
      officer.quinn = last_year_comp.quinn
      officer.total = last_year_comp.total
    end

    officer.complaints_count = officer.complaints.size

    officer.save
  end
end
