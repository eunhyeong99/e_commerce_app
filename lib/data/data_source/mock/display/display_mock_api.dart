import 'dart:convert';

import '../../../dto/common/response_wrapper/response_wrapper.dart';
import '../../../dto/display/menu/menu.dto.dart';
import '../../remote/display.api.dart';
import 'display_mock_data.dart';

class DisplayMockApi implements DisplayApi {
  @override
  Future<ResponseWrapper<List<MenuDto>>> getMenusByMallType(String mallType) {
    return Future(
      () => ResponseWrapper(
        data: _menuParser(
          mallType == 'market'
              ? DisplayMockData.menusByMarket
              : DisplayMockData.menusByBeauty,
        ),
        status: 'SUCCESS',
        code: '0000',
        message: '',
      ),
    );
  }

  List<MenuDto> _menuParser(String source) {
    List<MenuDto> menus = [];
    final List json = jsonDecode(source);
    menus = json.map((e) => MenuDto.fromJson(e)).toList();

    return menus;
  }
}
