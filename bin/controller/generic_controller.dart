import 'package:shelf_plus/shelf_plus.dart';
import 'package:shelf_multipart/form_data.dart';
import '../midleware/protected_endpoint.dart';
import '../service/auth/auth_service.dart';
import '../service/generic_service.dart';
import '../midleware/deserialization_resolver.dart';

class GenericController<T> extends ProtectedEndpoint {
  String domain;
  RouterPlus router;
  late GenericService<T> service;
  late AuthService authService;

  GenericController({required this.domain, required this.router}) {
    service = GenericService<T>();
    authService = AuthService();

    router.get('/$domain', getAll);
    router.get('/$domain/<id>', get);
    router.post('/$domain', add);
    router.put('/$domain/<id>', update);
    router.delete('/$domain/<id>', remove);
  }

  Future<Map<String, dynamic>> getAll(Request request) async {
    try {
      isAuthorized(request);
    } catch (e) {
      return {'error': e.toString()};
    }
    var items = await service.getAll();
    return {'items': items};
  }

  Future<Map<String, dynamic>> get(Request request, String id) async {
    try {
      isAuthorized(request);
    } catch (e) {
      return {'error': e.toString()};
    }
    var item = await service.get(int.parse(id));
    return {'item': item};
  }

  Future<Response> add(Request request) async {
    try {
      isAuthorized(request);
    } catch (e) {
      return Response.forbidden('Error: $e');
    }
    try {
      final parameters = <String, String>{
        await for (final formData in request.multipartFormData) formData.name: await formData.part.readString(),
      };
      T item = DeserializationResolver().resolve<T>(parameters);
      service.add(item);
      return Response.ok('Item added');
    } catch (e) {
      return Response.internalServerError(body: 'Error: $e');
    }
  }

  Future<Response> update(Request request, String id) async {
    try {
      isAuthorized(request);
    } catch (e) {
      return Response.forbidden('Error: $e');
    }
    try {
      final parameters = <String, String>{
        await for (final formData in request.multipartFormData) formData.name: await formData.part.readString(),
      };
      T item = DeserializationResolver().resolve<T>(parameters);
      service.update(item);
      return Response.ok('Item updated');
    } catch (e) {
      return Response.internalServerError(body: 'Error: $e');
    }
  }

  Future<Response> remove(Request request, String id) async {
    try {
      isAuthorized(request);
    } catch (e) {
      return Response.forbidden('Error: $e');
    }
    try {
      service.remove(int.parse(id));
      return Response.ok('Item removed');
    } catch (e) {
      return Response.internalServerError(body: 'Error: $e');
    }
  }
}
