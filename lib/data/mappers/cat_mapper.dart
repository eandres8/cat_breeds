import 'package:catbreets/domain/entities/cat.dart';
import 'package:catbreets/data/models/http/cat_response.dart';

class CatMapper {
  static List<Cat> catResponseToEntity(CatResponse catResponse) {
    return catResponse.catdata.map((cr) => Cat(
      affection: cr.affectionLevel,
      energy: cr.energyLevel,
      intelligence: cr.intelligence,
      personality: cr.temperament.split(', '),
      country: cr.origin,
      description: cr.description,
      id: cr.id,
      image: 'https://cdn2.thecatapi.com/images/${cr.referenceImageId}.jpg',
      name: cr.name,
    )).toList();
  }
}