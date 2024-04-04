import 'package:equatable/equatable.dart';
import 'package:municipium/services/network/dto/custom_menu_service_dto.dart';
import 'package:municipium/services/network/dto/digital_dossier_services_dto.dart';
import 'package:municipium/services/network/dto/features_dto.dart';
import 'package:municipium/services/network/dto/frontend_permission_dto.dart';
import 'package:municipium/services/network/dto/m_images_dto.dart';
import 'package:municipium/services/network/dto/new_menu_dto.dart';
import 'package:municipium/services/network/dto/private_section_dto.dart';
import 'package:municipium/services/network/dto/province_dto.dart';
import 'package:municipium/services/network/dto/tax_dto.dart';
import 'package:pine/dto/dto.dart';

class MunicipalityDTO extends DTO with EquatableMixin{
	String? issueUrl;
	String? prefix;
	String? googlePlusLink;
	bool? conciliaSandbox;
	bool? enableEnhancedIssues;
	String? zipCode;
	String? siteHeaderLogoType;
	String? pec;
	String? youtubeLink;
	ProvinceDTO? province;
	bool? draft;
	String? secondScript;
	String? telegramLink;
	int? id;
	String? fax;
	bool? nuovoBo;
	bool? enableSpontaneo;
	String? vatCode;
	bool? enableAuthentication;
	String? surface;
	int? eventsRepeating;
	bool? active;
	String? serviceProvider;
	String? serviceIndexEidas;
	String? siteBoxColor;
	String? serviceLabel;
	bool? enableLdap;
	String? sandboxClientId;
	String? phone;
	int? surveyLoginCode;
	String? iban;
	bool? jcityGovIntegration;
	String? linkedinLink;
	List<int>? civilDefencePointOfInterestCategoryIds;
	bool? itineraryEnabled;
	String? emergenzaSordi;
	String? codiceCatastale;
	String? roundedImage;
	String? serviceProviderCieid;
	double? latitude;
	String? facebookLink;
	List<int>? civilDefenceNewsCategoryIds;
	bool? isChild;
	String? skype;
	String? recaptchaSecretKey;
	String? accessibilityCode;
	String? jcityGovEnte;
	int? paymentLoginCode;
	String? headerUrl;
	bool? enableIssues;
	String? email;
	String? firstScript;
	DigitalDossierServicesDTO? digitalDossierServices;
	String? issueDescription;
	String? authLevelCieid;
	String? address;
	List<String>? languages;
	bool? enablePagamento;
	String? headerName;
	List<String>? menu;
	bool? enableAvviso;
	String? civilDefenceType;
	bool? issueStatistics;
	String? jcityGovUrl;
	int? provinceId;
	String? siteHeaderTitleType;
	PrivateSectionDTO? privateSection;
	int? newsRepeating;
	String? serviceIndex;
	bool? enableGarbageCalendar;
	bool? importSportello;
	int? siteTemplate;
	int? numberFaq;
	String? twitterLink;
	bool? enableFaq;
	bool? activeDms;
	NewMenuDTO? newMenu;
	String? clientId;
	MImagesDTO? siteLogo;
	String? appService1;
	FeaturesDTO? features;
	String? appService3;
	bool? hideContent;
	String? appService2;
	String? codiceSap;
	String? appService4;
	bool? conciliaEnabled;
	String? evaluationFormLink;
	String? instagramLink;
	String? conciliaServerIp;
	int? idGallery;
	MImagesDTO? logo;
	int? eventHomepageTemplate;
	String? clientSecret;
	String? slug;
	double? longitude;
	int? citizensNumber;
	bool? displayEventsCalendar;
	MImagesDTO? image;
	bool? bannerVisible;
	String? conciliaCustomerCode;
	bool? enableRegistration;
	bool? gdprEnabled;
	bool? penalityOnlineStampDuty;
	List<TaxDTO>? tax;
	String? siteHeaderTitle;
	bool? pagopaEnabled;
	String? recaptchaKey;
	MImagesDTO? background;
	String? name;
	String? subdomain;
	ProvinceDTO? region;
	int? istat;
	bool? enableEstrattoConto;
	String? sandboxClientSecret;
	String? authLevel;
	String? description;
	String? fiscalCode;
	List<CustomMenuServicesDTO>? customMenuServices;
	String? conciliaServerPort;
	int? newsIdForeground;
	bool? enableEvaluate;
	String? analyticsTrackingCode;
	String? urlDms;
	int? issuesLoginCode;
	String? pagopaCodiceTipoDebito;
	bool? deafEmergency;
	bool? galleryMosaic;
	bool? isAggregator;
	String? urlSportello;
	bool? enableExport;
	FrontendPermissionsDTO? frontendPermissions;
	String? siteHeaderColor;
	int? countPrenotazioni;
	bool? paypalEnabled;
	int? topBlocks;
	bool? cookiePolicyActive;
	bool? disableImage;
	bool? searchStreet;

	MunicipalityDTO({this.issueUrl, this.prefix, this.googlePlusLink, this.conciliaSandbox, this.enableEnhancedIssues, this.zipCode, this.siteHeaderLogoType, this.pec, this.youtubeLink, this.province, this.draft, this.secondScript, this.telegramLink, this.id, this.fax, this.nuovoBo, this.enableSpontaneo, this.vatCode, this.enableAuthentication, this.surface, this.eventsRepeating, this.active, this.serviceProvider, this.serviceIndexEidas, this.siteBoxColor, this.serviceLabel, this.enableLdap, this.sandboxClientId, this.phone, this.surveyLoginCode, this.iban, this.jcityGovIntegration, this.linkedinLink, this.civilDefencePointOfInterestCategoryIds, this.itineraryEnabled, this.emergenzaSordi, this.codiceCatastale, this.roundedImage, this.serviceProviderCieid, this.latitude, this.facebookLink, this.civilDefenceNewsCategoryIds, this.isChild, this.skype, this.recaptchaSecretKey, this.accessibilityCode, this.jcityGovEnte, this.paymentLoginCode, this.headerUrl, this.enableIssues, this.email, this.firstScript, this.digitalDossierServices, this.issueDescription, this.authLevelCieid, this.address, this.languages, this.enablePagamento, this.headerName, this.menu, this.enableAvviso, this.civilDefenceType, this.issueStatistics, this.jcityGovUrl, this.provinceId, this.siteHeaderTitleType, this.privateSection, this.newsRepeating, this.serviceIndex, this.enableGarbageCalendar, this.importSportello, this.siteTemplate, this.numberFaq, this.twitterLink, this.enableFaq, this.activeDms, this.newMenu, this.clientId, this.siteLogo, this.appService1, this.features, this.appService3, this.hideContent, this.appService2, this.codiceSap, this.appService4, this.conciliaEnabled, this.evaluationFormLink, this.instagramLink, this.conciliaServerIp, this.idGallery, this.logo, this.eventHomepageTemplate, this.clientSecret, this.slug, this.longitude, this.citizensNumber, this.displayEventsCalendar, this.image, this.bannerVisible, this.conciliaCustomerCode, this.enableRegistration, this.gdprEnabled, this.penalityOnlineStampDuty, this.tax, this.siteHeaderTitle, this.pagopaEnabled, this.recaptchaKey, this.background, this.name, this.subdomain, this.region, this.istat, this.enableEstrattoConto, this.sandboxClientSecret, this.authLevel, this.description, this.fiscalCode, this.customMenuServices, this.conciliaServerPort, this.newsIdForeground, this.enableEvaluate, this.analyticsTrackingCode, this.urlDms, this.issuesLoginCode, this.pagopaCodiceTipoDebito, this.deafEmergency, this.galleryMosaic, this.isAggregator, this.urlSportello, this.enableExport, this.frontendPermissions, this.siteHeaderColor, this.countPrenotazioni, this.paypalEnabled, this.topBlocks, this.cookiePolicyActive, this.disableImage, this.searchStreet});

	MunicipalityDTO.fromJson(Map<String, dynamic> json) {
    try {
      issueUrl = json['issue_url'];
		prefix = json['prefix'];
		googlePlusLink = json['google_plus_link'];
		conciliaSandbox = json['concilia_sandbox'];
		enableEnhancedIssues = json['enable_enhanced_issues'];
		zipCode = json['zip_code'];
		siteHeaderLogoType = json['site_header_logo_type'];
		pec = json['pec'];
		youtubeLink = json['youtube_link'];
		province = json['province'] != null ? new ProvinceDTO.fromJson(json['province']) : null;
		draft = json['draft'];
		secondScript = json['second_script'];
		telegramLink = json['telegram_link'];
		id = json['id'];
		fax = json['fax'];
		nuovoBo = json['nuovo_bo'];
		enableSpontaneo = json['enable_spontaneo'];
		vatCode = json['vat_code'];
		enableAuthentication = json['enable_authentication'];
		surface = json['surface'];
		eventsRepeating = json['events_repeating'];
		active = json['active'];
		serviceProvider = json['service_provider'];
		serviceIndexEidas = json['service_index_eidas'];
		siteBoxColor = json['site_box_color'];
		serviceLabel = json['service_label'];
		enableLdap = json['enable_ldap'];
		sandboxClientId = json['sandbox_client_id'];
		phone = json['phone'];
		surveyLoginCode = json['survey_login_code'];
		iban = json['iban'];
		jcityGovIntegration = json['jcity_gov_integration'];
		linkedinLink = json['linkedin_link'];
		civilDefencePointOfInterestCategoryIds = json['civil_defence_point_of_interest_category_ids']?.cast<int>();
		itineraryEnabled = json['itinerary_enabled'];
		emergenzaSordi = json['emergenza_sordi'];
		codiceCatastale = json['codice_catastale'];
		roundedImage = json['rounded_image'];
		serviceProviderCieid = json['service_provider_cieid'];
		latitude = json['latitude'];
		facebookLink = json['facebook_link'];
		civilDefenceNewsCategoryIds = json['civil_defence_news_category_ids']?.cast<int>();
		isChild = json['is_child'];
		skype = json['skype'];
		recaptchaSecretKey = json['recaptcha_secret_key'];
		accessibilityCode = json['accessibility_code'];
		jcityGovEnte = json['jcity_gov_ente'];
		paymentLoginCode = json['payment_login_code'];
		headerUrl = json['header_url'];
		enableIssues = json['enable_issues'];
		email = json['email'];
		firstScript = json['first_script'];
		digitalDossierServices = json['digital_dossier_services'] != null ? DigitalDossierServicesDTO.fromJson(json['digital_dossier_services']) : null;
		issueDescription = json['issue_description'];
		authLevelCieid = json['auth_level_cieid'];
		address = json['address'];
		languages = json['languages']?.cast<String>();
		enablePagamento = json['enable_pagamento'];
		headerName = json['header_name'];
		menu = json['menu']?.cast<String>();
		enableAvviso = json['enable_avviso'];
		civilDefenceType = json['civil_defence_type'];
		issueStatistics = json['issue_statistics'];
		jcityGovUrl = json['jcity_gov_url'];
		provinceId = json['province_id'];
		siteHeaderTitleType = json['site_header_title_type'];
		privateSection = json['private_section'] != null ? PrivateSectionDTO.fromJson(json['private_section']) : null;
		newsRepeating = json['news_repeating'];
		serviceIndex = json['service_index'];
		enableGarbageCalendar = json['enable_garbage_calendar'];
		importSportello = json['import_sportello'];
		siteTemplate = json['site_template'];
		numberFaq = json['number_faq'];
		twitterLink = json['twitter_link'];
		enableFaq = json['enable_faq'];
		activeDms = json['active_dms'];
		newMenu = json['new_menu'] != null ? NewMenuDTO.fromJson(json['new_menu']) : null;
		clientId = json['client_id'];
		siteLogo = json['site_logo'] != null ? MImagesDTO.fromJson(json['site_logo']) : null;
		appService1 = json['app_service_1'];
		features = json['features'] != null ? FeaturesDTO.fromJson(json['features']) : null;
		appService3 = json['app_service_3'];
		hideContent = json['hide_content'];
		appService2 = json['app_service_2'];
		codiceSap = json['codice_sap'];
		appService4 = json['app_service_4'];
		conciliaEnabled = json['concilia_enabled'];
		evaluationFormLink = json['evaluation_form_link'];
		instagramLink = json['instagram_link'];
		conciliaServerIp = json['concilia_server_ip'];
		idGallery = json['id_gallery'];
		logo = json['logo'] != null ?  MImagesDTO.fromJson(json['logo']) : null;
		eventHomepageTemplate = json['event_homepage_template'];
		clientSecret = json['client_secret'];
		slug = json['slug'];
		longitude = json['longitude'];
		citizensNumber = json['citizens_number'];
		displayEventsCalendar = json['display_events_calendar'];
		image = json['image'] != null ? MImagesDTO.fromJson(json['image']) : null;
		bannerVisible = json['banner_visible'];
		conciliaCustomerCode = json['concilia_customer_code'];
		enableRegistration = json['enable_registration'];
		gdprEnabled = json['gdpr_enabled'];
		penalityOnlineStampDuty = json['penality_online_stamp_duty'];
		if (json['tax'] != null) {
			tax = <TaxDTO>[];
			json['tax'].forEach((v) { tax!.add(TaxDTO.fromJson(v)); });
		}
		siteHeaderTitle = json['site_header_title'];
		pagopaEnabled = json['pagopa_enabled'];
		recaptchaKey = json['recaptcha_key'];
		background = json['background'] != null ? MImagesDTO.fromJson(json['background']) : null;
		name = json['name'];
		subdomain = json['subdomain'];
		region = json['region'] != null ? ProvinceDTO.fromJson(json['region']) : null;
		istat = json['istat'];
		enableEstrattoConto = json['enable_estratto_conto'];
		sandboxClientSecret = json['sandbox_client_secret'];
		authLevel = json['auth_level'];
		description = json['description'];
		fiscalCode = json['fiscal_code'];
		if (json['custom_menu_services'] != null) {
			customMenuServices = <CustomMenuServicesDTO>[];
			json['custom_menu_services'].forEach((v) { customMenuServices!.add(CustomMenuServicesDTO.fromJson(v)); });
		}
		conciliaServerPort = json['concilia_server_port'];
		newsIdForeground = json['news_id_foreground'];
		enableEvaluate = json['enable_evaluate'];
		analyticsTrackingCode = json['analytics_tracking_code'];
		urlDms = json['url_dms'];
		issuesLoginCode = json['issues_login_code'];
		pagopaCodiceTipoDebito = json['pagopa_codice_tipo_debito'];
		deafEmergency = json['deaf_emergency'];
		galleryMosaic = json['gallery_mosaic'];
		isAggregator = json['is_aggregator'];
		urlSportello = json['url_sportello'];
		enableExport = json['enable_export'];
		frontendPermissions = json['frontend_permissions'] != null ? FrontendPermissionsDTO.fromJson(json['frontend_permissions']) : null;
		siteHeaderColor = json['site_header_color'];
		countPrenotazioni = json['count_prenotazioni'];
		paypalEnabled = json['paypal_enabled'];
		topBlocks = json['top_blocks'];
		cookiePolicyActive = json['cookie_policy_active'];
		disableImage = json['disable_image'];
		searchStreet = json['search_street'];
    }catch (ex) {
      print(ex);
    }
		
    
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['issue_url'] = this.issueUrl;
		data['prefix'] = this.prefix;
		data['google_plus_link'] = this.googlePlusLink;
		data['concilia_sandbox'] = this.conciliaSandbox;
		data['enable_enhanced_issues'] = this.enableEnhancedIssues;
		data['zip_code'] = this.zipCode;
		data['site_header_logo_type'] = this.siteHeaderLogoType;
		data['pec'] = this.pec;
		data['youtube_link'] = this.youtubeLink;
		if (this.province != null) {
      data['province'] = this.province!.toJson();
    }
		data['draft'] = this.draft;
		data['second_script'] = this.secondScript;
		data['telegram_link'] = this.telegramLink;
		data['id'] = this.id;
		data['fax'] = this.fax;
		data['nuovo_bo'] = this.nuovoBo;
		data['enable_spontaneo'] = this.enableSpontaneo;
		data['vat_code'] = this.vatCode;
		data['enable_authentication'] = this.enableAuthentication;
		data['surface'] = this.surface;
		data['events_repeating'] = this.eventsRepeating;
		data['active'] = this.active;
		data['service_provider'] = this.serviceProvider;
		data['service_index_eidas'] = this.serviceIndexEidas;
		data['site_box_color'] = this.siteBoxColor;
		data['service_label'] = this.serviceLabel;
		data['enable_ldap'] = this.enableLdap;
		data['sandbox_client_id'] = this.sandboxClientId;
		data['phone'] = this.phone;
		data['survey_login_code'] = this.surveyLoginCode;
		data['iban'] = this.iban;
		data['jcity_gov_integration'] = this.jcityGovIntegration;
		data['linkedin_link'] = this.linkedinLink;
		data['civil_defence_point_of_interest_category_ids'] = this.civilDefencePointOfInterestCategoryIds;
		data['itinerary_enabled'] = this.itineraryEnabled;
		data['emergenza_sordi'] = this.emergenzaSordi;
		data['codice_catastale'] = this.codiceCatastale;
		data['rounded_image'] = this.roundedImage;
		data['service_provider_cieid'] = this.serviceProviderCieid;
		data['latitude'] = this.latitude;
		data['facebook_link'] = this.facebookLink;
		data['civil_defence_news_category_ids'] = this.civilDefenceNewsCategoryIds;
		data['is_child'] = this.isChild;
		data['skype'] = this.skype;
		data['recaptcha_secret_key'] = this.recaptchaSecretKey;
		data['accessibility_code'] = this.accessibilityCode;
		data['jcity_gov_ente'] = this.jcityGovEnte;
		data['payment_login_code'] = this.paymentLoginCode;
		data['header_url'] = this.headerUrl;
		data['enable_issues'] = this.enableIssues;
		data['email'] = this.email;
		data['first_script'] = this.firstScript;
		if (this.digitalDossierServices != null) {
      data['digital_dossier_services'] = this.digitalDossierServices!.toJson();
    }
		data['issue_description'] = this.issueDescription;
		data['auth_level_cieid'] = this.authLevelCieid;
		data['address'] = this.address;
		data['languages'] = this.languages;
		data['enable_pagamento'] = this.enablePagamento;
		data['header_name'] = this.headerName;
		data['menu'] = this.menu;
		data['enable_avviso'] = this.enableAvviso;
		data['civil_defence_type'] = this.civilDefenceType;
		data['issue_statistics'] = this.issueStatistics;
		data['jcity_gov_url'] = this.jcityGovUrl;
		data['province_id'] = this.provinceId;
		data['site_header_title_type'] = this.siteHeaderTitleType;
		if (this.privateSection != null) {
      data['private_section'] = this.privateSection!.toJson();
    }
		data['news_repeating'] = this.newsRepeating;
		data['service_index'] = this.serviceIndex;
		data['enable_garbage_calendar'] = this.enableGarbageCalendar;
		data['import_sportello'] = this.importSportello;
		data['site_template'] = this.siteTemplate;
		data['number_faq'] = this.numberFaq;
		data['twitter_link'] = this.twitterLink;
		data['enable_faq'] = this.enableFaq;
		data['active_dms'] = this.activeDms;
		if (this.newMenu != null) {
      data['new_menu'] = this.newMenu!.toJson();
    }
		data['client_id'] = this.clientId;
		if (this.siteLogo != null) {
      data['site_logo'] = this.siteLogo!.toJson();
    }
		data['app_service_1'] = this.appService1;
		if (this.features != null) {
      data['features'] = this.features!.toJson();
    }
		data['app_service_3'] = this.appService3;
		data['hide_content'] = this.hideContent;
		data['app_service_2'] = this.appService2;
		data['codice_sap'] = this.codiceSap;
		data['app_service_4'] = this.appService4;
		data['concilia_enabled'] = this.conciliaEnabled;
		data['evaluation_form_link'] = this.evaluationFormLink;
		data['instagram_link'] = this.instagramLink;
		data['concilia_server_ip'] = this.conciliaServerIp;
		data['id_gallery'] = this.idGallery;
		if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
		data['event_homepage_template'] = this.eventHomepageTemplate;
		data['client_secret'] = this.clientSecret;
		data['slug'] = this.slug;
		data['longitude'] = this.longitude;
		data['citizens_number'] = this.citizensNumber;
		data['display_events_calendar'] = this.displayEventsCalendar;
		if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
		data['banner_visible'] = this.bannerVisible;
		data['concilia_customer_code'] = this.conciliaCustomerCode;
		data['enable_registration'] = this.enableRegistration;
		data['gdpr_enabled'] = this.gdprEnabled;
		data['penality_online_stamp_duty'] = this.penalityOnlineStampDuty;
		if (this.tax != null) {
      data['tax'] = this.tax!.map((v) => v.toJson()).toList();
    }
		data['site_header_title'] = this.siteHeaderTitle;
		data['pagopa_enabled'] = this.pagopaEnabled;
		data['recaptcha_key'] = this.recaptchaKey;
		if (this.background != null) {
      data['background'] = this.background!.toJson();
    }
		data['name'] = this.name;
		data['subdomain'] = this.subdomain;
		if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
		data['istat'] = this.istat;
		data['enable_estratto_conto'] = this.enableEstrattoConto;
		data['sandbox_client_secret'] = this.sandboxClientSecret;
		data['auth_level'] = this.authLevel;
		data['description'] = this.description;
		data['fiscal_code'] = this.fiscalCode;
		if (this.customMenuServices != null) {
      data['custom_menu_services'] = this.customMenuServices!.map((v) => v.toJson()).toList();
    }
		data['concilia_server_port'] = this.conciliaServerPort;
		data['news_id_foreground'] = this.newsIdForeground;
		data['enable_evaluate'] = this.enableEvaluate;
		data['analytics_tracking_code'] = this.analyticsTrackingCode;
		data['url_dms'] = this.urlDms;
		data['issues_login_code'] = this.issuesLoginCode;
		data['pagopa_codice_tipo_debito'] = this.pagopaCodiceTipoDebito;
		data['deaf_emergency'] = this.deafEmergency;
		data['gallery_mosaic'] = this.galleryMosaic;
		data['is_aggregator'] = this.isAggregator;
		data['url_sportello'] = this.urlSportello;
		data['enable_export'] = this.enableExport;
		if (this.frontendPermissions != null) {
      data['frontend_permissions'] = this.frontendPermissions!.toJson();
    }
		data['site_header_color'] = this.siteHeaderColor;
		data['count_prenotazioni'] = this.countPrenotazioni;
		data['paypal_enabled'] = this.paypalEnabled;
		data['top_blocks'] = this.topBlocks;
		data['cookie_policy_active'] = this.cookiePolicyActive;
		data['disable_image'] = this.disableImage;
		data['search_street'] = this.searchStreet;
		return data;
	}
  
   @override
   // TODO: implement props
   List<Object?> get props => [
    issueUrl,
prefix,
googlePlusLink,
conciliaSandbox,
enableEnhancedIssues,
zipCode,
siteHeaderLogoType,
pec,
youtubeLink,
province,
draft,
secondScript,
telegramLink,
id,
fax,
nuovoBo,
enableSpontaneo,
vatCode,
enableAuthentication,
surface,
eventsRepeating,
active,
serviceProvider,
serviceIndexEidas,
siteBoxColor,
serviceLabel,
enableLdap,
sandboxClientId,
phone,
surveyLoginCode,
iban,
jcityGovIntegration,
linkedinLink,
civilDefencePointOfInterestCategoryIds,
itineraryEnabled,
emergenzaSordi,
codiceCatastale,
roundedImage,
serviceProviderCieid,
latitude,
facebookLink,
civilDefenceNewsCategoryIds,
isChild,
skype,
recaptchaSecretKey,
accessibilityCode,
jcityGovEnte,
paymentLoginCode,
headerUrl,
enableIssues,
email,
firstScript,
digitalDossierServices,
issueDescription,
authLevelCieid,
address,
languages,
enablePagamento,
headerName,
menu,
enableAvviso,
civilDefenceType,
issueStatistics,
jcityGovUrl,
provinceId,
siteHeaderTitleType,
privateSection,
newsRepeating,
serviceIndex,
enableGarbageCalendar,
importSportello,
siteTemplate,
numberFaq,
twitterLink,
enableFaq,
activeDms,
newMenu,
clientId,
siteLogo,
appService1,
features,
appService3,
hideContent,
appService2,
codiceSap,
appService4,
conciliaEnabled,
evaluationFormLink,
instagramLink,
conciliaServerIp,
idGallery,
logo,
eventHomepageTemplate,
clientSecret,
slug,
longitude,
citizensNumber,
displayEventsCalendar,
image,
bannerVisible,
conciliaCustomerCode,
enableRegistration,
gdprEnabled,
penalityOnlineStampDuty,
tax,
siteHeaderTitle,
pagopaEnabled,
recaptchaKey,
background,
name,
subdomain,
region,
istat,
enableEstrattoConto,
sandboxClientSecret,
authLevel,
description,
fiscalCode,
customMenuServices,
conciliaServerPort,
newsIdForeground,
enableEvaluate,
analyticsTrackingCode,
urlDms,
issuesLoginCode,
pagopaCodiceTipoDebito,
deafEmergency,
galleryMosaic,
isAggregator,
urlSportello,
enableExport,
frontendPermissions,
siteHeaderColor,
countPrenotazioni,
paypalEnabled,
topBlocks,
cookiePolicyActive,
disableImage,
searchStreet,
   ];
}