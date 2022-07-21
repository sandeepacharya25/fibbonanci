class ProductsModels{
  int? id;
  String? name;
  // DateTime date;
  String? description;
  String? image;
  int? price;

  ProductsModels({ this.id,this.name,this.description,this.image,this.price});
}

  List<ProductsModels> getProductDetail() {
  return [
    ProductsModels(
      id: 101,
      image:
          'https://images.unsplash.com/photo-1599076479757-7effbcd66acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
      name: 'Have a plant at your desk',
      price: 150,
      
      description:
          'Having a plant at your work desk can be really helpful. I don\'t know why though',
    ),
    ProductsModels(
      id: 102,
        image:
            'https://images.unsplash.com/photo-1599021277840-9d3f4f383742?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
        name: 'Eat your breakfast on time',
        
        price: 200,
       
        description:
            'You should eat your breakfast before 30 minutes, after you wake up.'),
   ProductsModels(
     image:
          'https://images.unsplash.com/photo-1567337710282-00832b415979?ixlib=rb-1.2.1&auto=format&fit=crop&w=3888&q=80',
      name: 'Have a plant at your desk',
      price: 200,
       
     
      description:
      'Having a plant at your work desk can be really helpful. I don\'t know why though',
    ),
    ProductsModels(
      image:
          'https://images.unsplash.com/photo-1599076479757-7effbcd66acb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
      name: 'Eat your breakfast on time',
      
        
        description: 'Y0u should eat your breakfast before 30 minutes, after you wake up.'
    ),
  
  ];
  
}

