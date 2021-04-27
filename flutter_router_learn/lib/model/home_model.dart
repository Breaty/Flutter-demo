import 'package:flutter_router_learn/model/config_model.dart';
import 'package:flutter_router_learn/model/common_model.dart';
import 'package:flutter_router_learn/model/grid_model.dart';

class HomeModal {
  final ConfigModel config;
  final CommonModel bannerList;
  final CommonModel localNavList;
  final GridNavModel gridNav;

  HomeModal({this.config, this.bannerList, this.localNavList, this.gridNav});


}