import 'package:logger/logger.dart';
import 'package:municipium/model/payment/self_payment.dart';
import 'package:municipium/services/network/api/payment_service/payment_service.dart';
import 'package:municipium/services/network/dto/self_payment_dto.dart';
import 'package:pine/utils/dto_mapper.dart';

class PaymentsRepository {
  final DTOMapper<SelfPaymentDTO, SelfPayment> selfPaymentsMapper;
  final PaymentService paymentService;
  final Logger logger;

  PaymentsRepository(
      {required this.selfPaymentsMapper,
      required this.paymentService,
      required this.logger});

  Future<List<SelfPayment>> getSelfPaymentsList(
      String baseUrl, String ente, String area, String codice) async {
    try {
      final selfPaymentsResponse =
          await paymentService.getSelfPayments(baseUrl, ente, area, codice);
      List<SelfPayment> list = [];
      if (selfPaymentsResponse.isNotEmpty) {
        for (var element in selfPaymentsResponse) {
          final selfPaymentListItem = selfPaymentsMapper.fromDTO(element);
          list.add(selfPaymentListItem);
        }
      }
      return list;
    } catch (error) {
      logger.e('Error in getting self payments ${error.toString()}');
      rethrow;
    }
  }
}
