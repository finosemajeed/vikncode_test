class SalesListResponseModel {
  int? statusCode;
  List<Data>? data;
  int? totalCount;

  SalesListResponseModel({this.statusCode, this.data, this.totalCount});

  SalesListResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['StatusCode'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StatusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = totalCount;
    return data;
  }
}

class Data {
  int? index;
  String? id;
  String? voucherNo;
  String? date;
  String? ledgerName;
  double? totalGrossAmtRounded;
  num? totalTaxRounded;
  double? grandTotalRounded;
  String? customerName;
  num? totalTax;
  String? status;
  double? grandTotal;
  bool? isBillwised;
  String? billwiseStatus;

  Data(
      {this.index,
      this.id,
      this.voucherNo,
      this.date,
      this.ledgerName,
      this.totalGrossAmtRounded,
      this.totalTaxRounded,
      this.grandTotalRounded,
      this.customerName,
      this.totalTax,
      this.status,
      this.grandTotal,
      this.isBillwised,
      this.billwiseStatus});

  Data.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    id = json['id'];
    voucherNo = json['VoucherNo'];
    date = json['Date'];
    ledgerName = json['LedgerName'];
    totalGrossAmtRounded = json['TotalGrossAmt_rounded'];
    totalTaxRounded = json['TotalTax_rounded'];
    grandTotalRounded = json['GrandTotal_Rounded'];
    customerName = json['CustomerName'];
    totalTax = json['TotalTax'];
    status = json['Status'];
    grandTotal = json['GrandTotal'];
    isBillwised = json['is_billwised'];
    billwiseStatus = json['billwise_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['index'] = index;
    data['id'] = id;
    data['VoucherNo'] = voucherNo;
    data['Date'] = date;
    data['LedgerName'] = ledgerName;
    data['TotalGrossAmt_rounded'] = totalGrossAmtRounded;
    data['TotalTax_rounded'] = totalTaxRounded;
    data['GrandTotal_Rounded'] = grandTotalRounded;
    data['CustomerName'] = customerName;
    data['TotalTax'] = totalTax;
    data['Status'] = status;
    data['GrandTotal'] = grandTotal;
    data['is_billwised'] = isBillwised;
    data['billwise_status'] = billwiseStatus;
    return data;
  }
}
