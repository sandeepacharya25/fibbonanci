class ServiceList{
  int? id;
  String? name;
  // DateTime date;
  String? description;
  String? image;
  int? price;

  ServiceList(
    {this.id,this.name,this.description,this.image,this.price});

}

List<ServiceList> getServices(){
  List<ServiceList> allServices=[];
  ServiceList service1=ServiceList(
    id: 101,
    image:
        'https://images.theconversation.com/files/455326/original/file-20220330-6091-15wvlvb.JPG?ixlib=rb-1.1.0&rect=814%2C25%2C7812%2C3906&q=45&auto=format&w=1356&h=668&fit=crop',
    name: 'Grocrey',
    price: 150,
    description:
        'Having a plant at your work desk can be really helpful. I don\'t know why though',
  );
  ServiceList service2=ServiceList(
     id: 102,
    image:
        'https://images.theconversation.com/files/455326/original/file-20220330-6091-15wvlvb.JPG?ixlib=rb-1.1.0&rect=814%2C25%2C7812%2C3906&q=45&auto=format&w=1356&h=668&fit=crop',
    name: 'Grocrey',
    price: 150,
    description:
        'Having a plant at your work desk can be really helpful. I don\'t know why though',
  );

  ServiceList service3=ServiceList(
    id: 103,
    image: 'https://www.insureon.com/-/media/blog/posts/2018/photo_computer-repair.jpg?h=370&iar=0&w=750&rev=8444837b5596473f82b6668742ff11a6',
    name: 'Computer Reparing',
    price:1500,
    description: 'A repair will almost always be cheaper than a replacement computer, but if the repair is looking to cost 50-70% of the cost of a replacement then you should always consider the age/condition of the machine before making a decision. And please – Always get a free quote before deciding to skip a repair.',
  );

  ServiceList service4=ServiceList(
    id: 104,
    image: 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000',
    name: 'Doctor Appointment',
    price: 1500,
    description: 'MD MBBS ',
  );
  ServiceList service5=ServiceList(
    id: 104,
    image: 'https://img.freepik.com/free-vector/doctor-character-background_1270-84.jpg?w=2000',
    name: 'Doctor Appointment',
    price: 1500,
    description: 'MD MBBS ',
  );
  allServices.add(service1);
  allServices.add(service2);
  allServices.add(service3);
  allServices.add(service4);
  allServices.add(service5);

  return allServices;

}