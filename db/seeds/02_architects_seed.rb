puts 'deleting appointments & then architects'

Appointment.destroy_all
Architect.destroy_all

regular_dates = [
DateTime.parse('2019-06-26T11: 00: 00'),
DateTime.parse('2019-06-22T09: 00: 00'),
DateTime.parse('2019-06-24T13: 00: 00'),
DateTime.parse('2019-06-28T17: 00: 00')
]

pitch_date = DateTime.parse ('2019-06-21T17: 00: 00')

puts 'creating Architect 1...'
appts = []
6.times do
  appts << regular_dates.sample + rand(0..7)
end

Architect.create!(
  name: "De Rosee Sa",
  website_url: "https://deroseesa.com",
  location: "London - West",
  bio: "De Rosee Sa are an award-winning, architectural and interior design company based\
   in West London. Established in 2007 by directors Max de Rosee and Claire Sa, the practice\
    has built a reputation for designing imaginative and well-considered schemes spanning \
    the residential, educational, retail and community sectors. De Rosee Sa’s unique and \
    collaborative design approach allows them to develop each project on an individual basis \
    rather than having a set style. Their buildings provide elegant and creative solutions \
    to meet the practical and budgetary needs of a project whilst also maximising value for \
    their clients.",
  portfolio_url: [
    "https://deroseesa.com/wp-content/uploads/deroseesa-project-the-courtyard-house-003.jpg",
    "https://deroseesa.com/wp-content/uploads/deroseesa-project-the-courtyard-house-006.jpg",
    "https://deroseesa.com/wp-content/uploads/deroseesa-project-blue-house-002.jpg",
    "https://deroseesa.com/wp-content/uploads/deroseesa-project-stradella-road-005.jpg"
  ],
  available: true,
  speciality: "New Build: City Home",
  min_project_budget: 200_000,
  appt_times: appts,
  appt_rate: 350
  )



puts 'creating Architect 2...'
appts = []
6.times do
  appts << regular_dates.sample + rand(0..7)
end

Architect.create!(
  name: "Henning Stummel Architects",
  website_url: "http://henningstummelarchitects.com/",
  location: "London - West",
  bio: "Henning Stummel Architects are a small, award-winning architectural practice, founded in 2000.\
   Being passionate about architecture, design and place-making, they work closely with clients to \
   develop the brief and deliver projects which engage and delight. Their process is developed through\
    listening and clear communication, both visually and verbally, which in turn empowers clients and \
    convinces planners.",
  portfolio_url: [
    "https://www.themodernhouse.com/wp-content/uploads/2014/05/The-Workshop-Henning-Stummel-1-1600x1067.jpg",
    "https://www.themodernhouse.com/wp-content/uploads/2014/05/The-Workshop-Henning-Stummel-2-1600x1067.jpg",
    "http://henningstummelarchitects.com/wp-content/uploads/2016/12/4_Interior-TOP-Dining-Table-LC.jpg"
        ],
  available: true,
  speciality: "Conversion",
  min_project_budget: 150_000,
  appt_times: appts,
  appt_rate: 200
  )

puts 'creating Architect 3...'
appts = []
6.times do
  appts << regular_dates.sample + rand(0..7)
end

Architect.create!(
  name: "Studio McLeod",
  website_url: "http://studiomcleod.com/",
  location: "London - North",
  bio: "Studio McLeod are recognised as one of the UK’s leading architects for innovative \
  residential architecture. We are a dedicated and close knit team with shared values and \
  a drive to produce exceptional work. Our approach of really listening to our clients and \
  working out what would make the biggest difference to their lives has been referred to \
  as ‘Architectural Therapy’. Our clients have described the process as efficient and \
  inspiring and the end results as calming, captivating and fulfilling.",
  portfolio_url: [
    "https://static1.squarespace.com/static/58a2e8de5016e1926ab6d7f4/58c02d48e58c62f7844c7172/59ad9a5da803bb10befac733/1504549479199/Studio-McLeod-Gondar-Gardens-4-RT.jpg?format=2500w",
    "https://static1.squarespace.com/static/58a2e8de5016e1926ab6d7f4/t/59addd9b2994ca092caa91b4/1504626525669/Studio-McLeod-Hammersmith-Grove-9.jpg?format=2500w",
    "https://static1.squarespace.com/static/58a2e8de5016e1926ab6d7f4/58a30b0ee3df28d39e2fc9a7/58fe10f217bffcd18b275006/1504631112927/Studio-McLeod-Coquet-Moor-House-5.jpg?format=2500w"
  ],
  available: true,
  speciality: "New Build: Eco-Home",
  min_project_budget: 200_000,
  appt_times: appts,
  appt_rate: 200
  )

puts 'creating Architect 4...'
appts = []
6.times do
  appts << regular_dates.sample + rand(0..5)
end

Architect.create!(
  name: "Robert Dye Architects",
  website_url: "http://www.robertdye.com/",
  location: "London - North",
  bio: "Robert Dye Architects was formed in 1990 and soon afterwards was selected by the Architecture Foundation \
  as one of Britain´s best young architecture practices. Two decades on, RDA has secured its reputation as outstanding \
  residential architects; having won several design awards including the RIBA Manser Medal (for the best new one-off \
  house), the CEDIA award (in the press known as the Oscars of the home technology awards) and winner of Best Residential \
  Design in the 2014 Daily Telegraph H&R awards.",
  portfolio_url: [
    "http://www.robertdye.com/media/uploads/2010/10/1718/main-150-rda-hamilton-terrace11.jpg",
    "http://www.robertdye.com/media/uploads/2013/02/1997/main-1e.jpg",
    "http://www.robertdye.com/media/uploads/2010/10/1732/main-166-rda-luptonst2.jpg"
  ],
  available: true,
  speciality: "Conversion",
  min_project_budget: 200_000,
  appt_times: appts,
  appt_rate: 225
  )

puts 'creating Architect 5...'
appts = []
6.times do
  appts << regular_dates.sample + rand(0..5)
end

Architect.create!(
  name: "Red Deer",
  website_url: "https://www.reddeer.co.uk/",
  location: "London - East",
  bio: "We are herd of Architects, friends and designers – founded by Lionel Real de Azúa, \
  Ciarán O’Brien and Lucas Che Tizard in an attempt to better engage with the world around \
  them. Love for the unexpected forms a starting point in our design work, studio ethos \
  and adventures in travel.",
  portfolio_url: [
    "https://www.reddeer.co.uk/assets/_landscape2000/EnglefieldRd_09.jpg",
    "https://www.reddeer.co.uk/assets/_landscape2000/EnglefieldRd_33.jpg",
    "https://www.reddeer.co.uk/assets/_landscape2000/RegalClose44.jpg",
    "https://www.reddeer.co.uk/assets/_landscape2000/SloaneCourtWest1stFloor_MariellHansen9.jpg"
     ],
  available: true,
  speciality: "Renovation",
  min_project_budget: 250_000,
  appt_times: appts,
  appt_rate: 225
  )

puts 'creating Architect 6...'
appts = []
6.times do
  appts << regular_dates.sample + rand(0..5)
end

Architect.create!(
  name: "Conform Architects",
  website_url: "https://www.conformarchitects.com/",
  location: "London - South",
  bio: "The ethos behind our architecture is underpinned by a rigorous design process which always explores \
  both context and form. We believe context is not just the physical surroundings but also the social, cultural \
  and historical uniqueness of place. We strive to investigate these contextual facets through the development \
  of relevant forms, with concepts and designs that challenge our clients, their brief and ambitions. Our \
  architecture embraces light and investigates materiality; engendering an innate detail and craft in our built form.",
  portfolio_url: [
    "https://static1.squarespace.com/static/5807e9b9d482e9d2da1eff2e/t/5ab1233f03ce640c3c525030/1521560051263/levels_ten%2Beleven-con_form_architects_02.jpg?format=1500w",
    "https://static1.squarespace.com/static/5807e9b9d482e9d2da1eff2e/t/5c56ff9f7817f790cc089ea9/1549234041878/repoussoir-con_form_architects_02.jpg?format=1500w",
    "https://static1.squarespace.com/static/5807e9b9d482e9d2da1eff2e/t/5c57747415fcc09e6fcb856f/1549235324881/dormore-con_form_architects_06.jpg?format=1500w"
  ],
  available: true,
  speciality: "Renovation",
  min_project_budget: 250_000,
  appt_times: appts,
  appt_rate: 225
  )

puts "Creating Country Home Architects"

puts 'creating Architect 1...'
appts = []
appts << pitch_date
6.times do
  appts << regular_dates.sample + rand(0..5)
end

Architect.create!(
  name: "31/44 Architects",
  website_url: "http://www.3144architects.com/projects",
  location: "London - East",
  bio: "31/44 Architects is a London-based architectural practice headed by Will Burges and Stephen Davies.\
   31/44 refers to the practice’s two studio locations in the Netherlands (Amsterdam) and the UK (London) \
 when founded in 2010. Now based solely in London, near Brick Lane, the practice currently comprises a \
  team of nine architects and architectural assistants.

Projects range in scale from strategic masterplanning through to smaller-scale residential work. Completed \
projects include a family home in the Netherlands, a mixed-use retail and hotel building in Shoreditch, and \
a number of one-off individual homes around London. The practice has also recently caught the attention of \
the architectural press, garnering nominations and awards for No. 49 and Red House.",
  portfolio_url: [
    "http://www.3144architects.com/wp-content/uploads/2013/05/44_0815_kitchen2.jpg",
    "http://www.3144architects.com/wp-content/uploads/2013/01/0815_RWG_Rear-View-In.jpg",
    "http://www.3144architects.com/wp-content/uploads/2013/01/0815_RWG_Rear-View-Out.jpg"
  ],
  available: true,
  speciality: "New Build: Country Home",
  min_project_budget: 200_000,
  appt_times: appts,
  appt_rate: 200
  )

puts 'creating Architect 8...'
appts = []
  appts << pitch_date
6.times do
  appts << regular_dates.sample + rand(0..5)
end

Architect.create!(
  name: "Archmongers",
  website_url: "http://archmongers.com/portfolio_page",
  location: "London - East",
  bio: "Archmongers is an award-winning London-based architectural studio founded by \
  Margaret Bursa and Johan Hybschmann. We provide the complete design of buildings from \
  feasibility to final details, before overseeing on-site construction to practical completion. \
  We offer a fully integrated interior design service that complements the overarching \
  architectural concept, delivering new builds through to fit-outs to a high level of quality and detail.",
  portfolio_url: [
    "http://archmongers.com/wp-content/uploads/2016/11/20170706-DSC_6805-LO-RES-1024x684.jpg",
    "http://archmongers.com/wp-content/uploads/2016/11/DSC_6227.jpg",
    "http://archmongers.com/wp-content/uploads/2016/11/THE_RYDE-7374.jpg"
    ],
  available: true,
  speciality: "New Build: Country Home",
  min_project_budget: 200_000,
  appt_times: appts,
  appt_rate: 200
  )

puts 'creating Architect 2...'
appts = []
  appts << pitch_date
6.times do
  appts << regular_dates.sample + rand(0..5)
end

Architect.create!(
  name: "McLean Quinlan",
  website_url: "https://mcleanquinlan.com/works/",
  location: "London - West",
  bio: "McLean Quinlan are housemakers, creating distinct, beautifully crafted architecture, in the town, \
  the countryside, in the UK and overseas. They love what they do; delighting in the detail, the use of light \
    and materials, the sensory, the tactile, and the making of spaces that age with grace. They themselves are\
     a family, and are mindful that creating a home is a journey, a life experience. The studio are always \
     careful to understand the way you live and what you enjoy. This is the key to designing a home that \
     is truly yours.",
  portfolio_url: [
    "https://mcleanquinlan.com/img/works/polzeath-house/mclean-quinlan-polzeath-house-4@2x.1547812778.jpg",
    "https://mcleanquinlan.com/img/works/polzeath-house/mclean-quinlan-polzeath-house-10@2x.1547812784.jpg",
    "https://mcleanquinlan.com/img/works/chiltern-barns/mclean-quinlan-chiltern-barns-2@2x.1547812633.jpg",
    "https://mcleanquinlan.com/img/works/kent-downs-house/mclean-quinlan-kent-downs-house-2@2x.1547812740.jpg" ],
  available: true,
  speciality: "New Build: Country Home",
  min_project_budget: 500_000,
  appt_times: appts,
  appt_rate: 200
  )

puts 'creating Architect 3...'
appts = []
appts << pitch_date
6.times do
  appts << regular_dates.sample + rand(0..7)
end

Architect.create!(
  name: "Emil Eve Architects",
  website_url: "https://www.emileve.co.uk/",
  location: "London - North",
  bio: "Emil Eve Architects was founded by Emma and Ross Perkin in 2010 and is based in Hackney.\
   Past projects include housing, retail spaces, galleries and work studios where \
   they provide architectural and interior design services. Emil Eve Architects specialise in \
   working with historic and listed buildings and enjoy the challenge of introducing contemporary \
   interventions into complex contexts.",
  portfolio_url: [
    "https://www.emileve.co.uk/assets/Uploads/_resampled/ScaleWidthWyIxNTg0Il0/1a.jpg",
    "https://www.emileve.co.uk/assets/Uploads/_resampled/ScaleWidthWyIxNTg0Il0/Ext-small2.jpg",
    "https://www.emileve.co.uk/assets/Uploads/_resampled/ScaleWidthWyIxNTg0Il0/186.jpg"
  ],
  available: true,
  speciality: "New Build: Country Home",
  min_project_budget: 100_000,
  appt_times: appts,
  appt_rate: 175
  )
