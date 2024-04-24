import 'package:municipium/model/municipium_image.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class MunicipiumImageMapper extends DTOMapper<MImagesDTO, MunicipiumImage> {
  @override
  MunicipiumImage fromDTO(MImagesDTO dto) => MunicipiumImage(
      i1280: dto.i1280,
      i300x300: dto.i300x300,
      baseUrl: dto.baseUrl,
      i720x960: dto.i720x960,
      i1920x1280: dto.i1920x1280);

  @override
  MImagesDTO toDTO(MunicipiumImage model) => MImagesDTO(
      i1280: model.i1280,
      i300x300: model.i300x300,
      baseUrl: model.baseUrl,
      i720x960: model.i720x960);
}
