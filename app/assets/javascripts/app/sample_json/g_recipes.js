// Generator

[
  {
    'repeat:8': {
      id: '{{index()}}',
      picture: 'http://www.erichdoubek.com/emmanuel/wp-content/uploads/2011/09/shaker-pint.jpg',
      time: '{{integer(40, 600)}}',
      score: '{{integer(0, 5)}}',
      difficulty: '{{random("easy", "medium", "hard", "hardcore")}}',
      process: '{{lorem(2, "words")}}',
      name: '{{lorem(1, "words")}}',
      user_style: '{{lorem(4, "words")}}',
      style: '{{lorem(3, "words")}}',
      author: {
        first_name: '{{firstName()}}',
        last_name: '{{surname()}}'
      },
      hop: '{{company()}}',
      malt: '{{company()}}',
      origin: '{{country()}}',
      description: '{{lorem(1, "paragraphs")}}',
      created_at: '{{moment(this.date(new Date(2014, 0, 1), new Date())).format("LLLL")}}',
      tags: [
        {
          'repeat:5': '{{lorem(1, "words")}}'
        }
      ]
    }
  }
]
