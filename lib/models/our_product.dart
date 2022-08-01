class Feed {
  int? id;
  String? name;
  // DateTime date;
  String? description;
  String? image;
  int? price;

  Feed({this.id, this.name, this.description, this.image, this.price});
}

List<Feed> getFeeds() {
  List<Feed> allFeeds = [];

  Feed feed1 = Feed(
    id: 101,
    image:
        'https://images.theconversation.com/files/455326/original/file-20220330-6091-15wvlvb.JPG?ixlib=rb-1.1.0&rect=814%2C25%2C7812%2C3906&q=45&auto=format&w=1356&h=668&fit=crop',
    name: 'Grocrey',
    price: 150,
    description:
        'Having a plant at your work desk can be really helpful. I don\'t know why though',
  );

  Feed feed2 = Feed(
    id: 102,
    image:
        'https://images.unsplash.com/photo-1599021277840-9d3f4f383742?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    name: 'Eat your breakfast on time',
    price: 200,
    description:
        'You should eat your breakfast before 30 minutes, after you wake up.',
  );

  Feed feed3 = Feed(
    image:
        'https://images.unsplash.com/photo-1567337710282-00832b415979?ixlib=rb-1.2.1&auto=format&fit=crop&w=3888&q=80',
    name: 'Have a plant at your desk',
    price: 200,
    description:
        'Having a plant at your work desk can be really helpful. I don\'t know why though',
  );

  Feed feed4 = Feed(
    image:
        'https://images.unsplash.com/photo-1599076479757-7effbcd66acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    name: 'Eat your breakfast on time',
    description:
        'Y0u should eat your breakfast before 30 minutes, after you wake up.',
  );

  allFeeds.add(feed1);
  allFeeds.add(feed2);
  allFeeds.add(feed3);
  allFeeds.add(feed4);

  return allFeeds;
}

/*

imageUrl:
'https://images.unsplash.com/photo-1567337710282-00832b415979?ixlib=rb-1.2.1&auto=format&fit=crop&w=3888&q=80',

uploaderImageUrl:
'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FHqMxT0guGuI%2Fmaxresdefault.jpg&f=1&nofb=1',

imageUrl:
'https://images.unsplash.com/photo-1599076479757-7effbcd66acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80’,


uploaderImageUrl:
'https://scontent.fktm10-1.fna.fbcdn.net/v/t1.0-9/117436570_101417711683280_1138836161271393737_n.jpg?_nc_cat=106&_nc_sid=85a577&_nc_ohc=wWAP4Es26yEAX_Mt4tw&_nc_ht=scontent.fktm10-1.fna&oh=e2d1df771169e572d5a1c3e74cf32b54&oe=5F772E75',
  */


