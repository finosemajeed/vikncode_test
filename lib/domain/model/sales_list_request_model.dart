class SalesListRequestModel {
  int? branchID;
  String? companyID;
  int? createdUserID;
  int? priceRounding;
  int? pageNo;
  int? itemsPerPage;
  String? type;
  int? warehouseID;

  SalesListRequestModel(
      {this.branchID,
      this.companyID,
      this.createdUserID,
      this.priceRounding,
      this.pageNo,
      this.itemsPerPage,
      this.type,
      this.warehouseID});

  SalesListRequestModel.fromJson(Map<String, dynamic> json) {
    branchID = json['BranchID'];
    companyID = json['CompanyID'];
    createdUserID = json['CreatedUserID'];
    priceRounding = json['PriceRounding'];
    pageNo = json['page_no'];
    itemsPerPage = json['items_per_page'];
    type = json['type'];
    warehouseID = json['WarehouseID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BranchID'] = branchID;
    data['CompanyID'] = companyID;
    data['CreatedUserID'] = createdUserID;
    data['PriceRounding'] = priceRounding;
    data['page_no'] = pageNo;
    data['items_per_page'] = itemsPerPage;
    data['type'] = type;
    data['WarehouseID'] = warehouseID;
    return data;
  }
}
