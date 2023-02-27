class TaxDTO {
	bool? downloadDocument;
	bool? downloadF24;
	String? taxDescription;
	String? taxCode;

	TaxDTO({this.downloadDocument, this.downloadF24, this.taxDescription, this.taxCode});

	TaxDTO.fromJson(Map<String, dynamic> json) {
		downloadDocument = json['download_document'];
		downloadF24 = json['download_f24'];
		taxDescription = json['tax_description'];
		taxCode = json['tax_code'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['download_document'] = this.downloadDocument;
		data['download_f24'] = this.downloadF24;
		data['tax_description'] = this.taxDescription;
		data['tax_code'] = this.taxCode;
		return data;
	}
}