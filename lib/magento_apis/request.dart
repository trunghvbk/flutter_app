import 'package:flutter_app/magento_apis/api_keys.dart';
import 'package:network/network.dart';

const String _baseUrl = "demo.fatherofapps.com";
const String _path = "/data/V1";

class MagentoAPIRequest extends Request {
  final String apiKey;

  @override
  Map<String, String> get headers {
    return {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $apiKey',
    };
  }

  @override
  Map<String, Object> get parameters {
    Map<String, Object> params = additionalParameters;
    if (searchCriterias != null && searchCriterias!.isNotEmpty) {
      searchCriterias!.asMap().forEach((filterGroup, value) {
        value.asMap().forEach((filter, searchCriteria) {
          params["searchCriteria[filter_groups][$filterGroup][filters][$filter][field]"] =
              searchCriteria.field;
          params["searchCriteria[filter_groups][$filterGroup][filters][$filter][value]"] =
              searchCriteria.value;
          params["searchCriteria[filter_groups][$filterGroup][filters][$filter][condition_type]"] =
              searchCriteria.conditionType;
        });
      });
    }

    if (sortCriterias != null && sortCriterias!.isNotEmpty) {
      sortCriterias!.asMap().forEach((index, value) {
        params["searchCriteria[sortOrders][$index][field]"] = value.field;
        params["searchCriteria[sortOrders][$index][direction]"] =
            value.sortDirection;
      });
    }

    if (pageCriteria != null) {
      params["searchCriteria[pageSize]"] = pageCriteria!.pageSize;
      params["searchCriteria[currentPage]"] = pageCriteria!.currentPage;
    }

    if (fields != null) {
      params["fields"] = fields!;
    }

    return params;
  }

  Map<String, Object> additionalParameters;
  List<List<SearchCriteria>>? searchCriterias;
  List<SortCriteria>? sortCriterias;
  PageCriteria? pageCriteria;
  String? fields;

  MagentoAPIRequest({
    this.apiKey = APIKeys.common,
    String host = _baseUrl,
    String path = _path,
    required String endPoint,
    HttpMethod method = HttpMethod.get,
    this.additionalParameters = const {},
    this.searchCriterias,
    this.sortCriterias,
    this.pageCriteria,
    this.fields,
  }) : super(host: host, path: path, endPoint: endPoint, method: method);
}

class PageCriteria {
  int pageSize;
  int currentPage;
  PageCriteria({
    required this.pageSize,
    required this.currentPage,
  });
}

class SortCriteria {
  String field;
  SortDirection sortDirection;
  SortCriteria({
    required this.field,
    required this.sortDirection,
  });
}

enum SortDirection { asc, desc }

class SearchCriteria {
  String field;
  Object value;
  SearchConditionType conditionType;
  SearchCriteria({
    required this.field,
    required this.value,
    required this.conditionType,
  });
}

enum SearchConditionType {
  eq,
  finset,
  from,
  gt,
  gteq,
  like,
  lt,
  lteq,
  moreq,
  neq,
  nin,
  notnull,
  null_,
  to,
  in_
}
