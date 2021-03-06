# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# # Load incidents
# Importer::CrimeIncidentReports.import_all
# Importer::DistrictJournal.import_all

# # load field contacts
# Importer::FieldContact.import_all
# Importer::FieldContactName.import_all

# # Load annual earnings report (from HR department)
# Importer::EmployeeEarnings.import_all

# # Load BPD employee lists (these include empl_id field)
# Importer::EmployeeListing.import_all

# # Discover more BPD employees from incidents table, which was
# # created by Importer::DistrictJournal above
# Populater::OfficersFromIncidents.populate

# # use fuzzy matching to populate hr_name for officers where we
# # just have a journal_name (necessary so we can associate compensation
# # with each officer later)
# Populater::OfficerHrNames.populate

# # set officer field on each Incident object
# Populater::IncidentOfficers.populate

# # set officer field on each Compensation object
# Populater::Compensations.populate

# # set officer field on each FieldContact object
# Populater::FieldContactOfficers.populate

# # bring in internal affairs complaints
# Importer::BpdIaData.import_all
# Importer::OfficerIaLog.import_all # run 2nd to update summaries
# Populater::ComplaintOfficers.populate

# # import zip data
# Importer::Zip.import_all

# # update caches
# FieldContact.counter_culture_fix_counts
# FieldContactName.counter_culture_fix_counts
# Incident.counter_culture_fix_counts
# Populater::Officers.populate
# Populater::FieldContacts.populate
