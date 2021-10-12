class Category < ActiveHash::Base
  self.data = [
    {id: 0,  name: '---'},
    {id: 1,  name: 'ペット'},
    {id: 2,  name: '人物'},   
    {id: 3,  name: '趣味'},
    {id: 4,  name: '食べ物'},
    {id: 5,  name: '日常'},
    {id: 6,  name: '旅'},
    {id: 7,  name: '風景'},
    {id: 8,  name: '仕事'},
    {id: 9,  name: 'なんか撮れてたやつ'},
    {id: 10, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :photos
end