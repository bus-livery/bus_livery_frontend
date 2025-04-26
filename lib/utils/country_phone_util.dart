import 'package:country_code_picker/country_code_picker.dart';

/// Utility class providing phone number information for countries
class CountryPhoneUtil {
  /// Returns the maximum phone number length for a given country code
  /// These are approximate values and may vary depending on the country's telecom policies
  static int getMaxPhoneLength(CountryCode countryCode) {
    final code = countryCode.code;

    // Map of country codes to their maximum phone number lengths (excluding country code)
    final Map<String, int> phoneLengthMap = {
      'AF': 9, // Afghanistan
      'AL': 9, // Albania
      'DZ': 9, // Algeria
      'AD': 6, // Andorra
      'AO': 9, // Angola
      'AG': 10, // Antigua and Barbuda
      'AR': 10, // Argentina
      'AM': 8, // Armenia
      'AU': 9, // Australia
      'AT': 10, // Austria
      'AZ': 9, // Azerbaijan
      'BS': 10, // Bahamas
      'BH': 8, // Bahrain
      'BD': 10, // Bangladesh
      'BB': 10, // Barbados
      'BY': 9, // Belarus
      'BE': 9, // Belgium
      'BZ': 7, // Belize
      'BJ': 8, // Benin
      'BT': 8, // Bhutan
      'BO': 8, // Bolivia
      'BA': 8, // Bosnia and Herzegovina
      'BW': 7, // Botswana
      'BR': 11, // Brazil
      'BN': 7, // Brunei
      'BG': 9, // Bulgaria
      'BF': 8, // Burkina Faso
      'BI': 8, // Burundi
      'KH': 9, // Cambodia
      'CM': 9, // Cameroon
      'CA': 10, // Canada
      'CV': 7, // Cape Verde
      'CF': 8, // Central African Republic
      'TD': 8, // Chad
      'CL': 9, // Chile
      'CN': 11, // China
      'CO': 10, // Colombia
      'KM': 7, // Comoros
      'CG': 9, // Congo
      'CR': 8, // Costa Rica
      'HR': 9, // Croatia
      'CU': 8, // Cuba
      'CY': 8, // Cyprus
      'CZ': 9, // Czech Republic
      'DK': 8, // Denmark
      'DJ': 6, // Djibouti
      'DM': 10, // Dominica
      'DO': 10, // Dominican Republic
      'EC': 9, // Ecuador
      'EG': 10, // Egypt
      'SV': 8, // El Salvador
      'GQ': 9, // Equatorial Guinea
      'ER': 7, // Eritrea
      'EE': 8, // Estonia
      'ET': 9, // Ethiopia
      'FJ': 7, // Fiji
      'FI': 9, // Finland
      'FR': 9, // France
      'GA': 7, // Gabon
      'GM': 7, // Gambia
      'GE': 9, // Georgia
      'DE': 11, // Germany
      'GH': 9, // Ghana
      'GR': 10, // Greece
      'GD': 10, // Grenada
      'GT': 8, // Guatemala
      'GN': 9, // Guinea
      'GW': 7, // Guinea-Bissau
      'GY': 7, // Guyana
      'HT': 8, // Haiti
      'HN': 8, // Honduras
      'HK': 8, // Hong Kong
      'HU': 9, // Hungary
      'IS': 7, // Iceland
      'IN': 10, // India
      'ID': 11, // Indonesia
      'IR': 10, // Iran
      'IQ': 10, // Iraq
      'IE': 9, // Ireland
      'IL': 9, // Israel
      'IT': 10, // Italy
      'JM': 10, // Jamaica
      'JP': 10, // Japan
      'JO': 9, // Jordan
      'KZ': 10, // Kazakhstan
      'KE': 9, // Kenya
      'KI': 5, // Kiribati
      'KP': 10, // North Korea
      'KR': 10, // South Korea
      'KW': 8, // Kuwait
      'KG': 9, // Kyrgyzstan
      'LA': 10, // Laos
      'LV': 8, // Latvia
      'LB': 8, // Lebanon
      'LS': 8, // Lesotho
      'LR': 7, // Liberia
      'LY': 8, // Libya
      'LI': 7, // Liechtenstein
      'LT': 8, // Lithuania
      'LU': 9, // Luxembourg
      'MO': 8, // Macau
      'MK': 8, // Macedonia
      'MG': 9, // Madagascar
      'MW': 9, // Malawi
      'MY': 9, // Malaysia
      'MV': 7, // Maldives
      'ML': 8, // Mali
      'MT': 8, // Malta
      'MH': 7, // Marshall Islands
      'MR': 8, // Mauritania
      'MU': 8, // Mauritius
      'MX': 10, // Mexico
      'FM': 7, // Micronesia
      'MD': 8, // Moldova
      'MC': 8, // Monaco
      'MN': 8, // Mongolia
      'ME': 8, // Montenegro
      'MA': 9, // Morocco
      'MZ': 9, // Mozambique
      'MM': 10, // Myanmar
      'NA': 9, // Namibia
      'NR': 7, // Nauru
      'NP': 10, // Nepal
      'NL': 9, // Netherlands
      'NZ': 9, // New Zealand
      'NI': 8, // Nicaragua
      'NE': 8, // Niger
      'NG': 10, // Nigeria
      'NO': 8, // Norway
      'OM': 8, // Oman
      'PK': 10, // Pakistan
      'PW': 7, // Palau
      'PA': 8, // Panama
      'PG': 8, // Papua New Guinea
      'PY': 9, // Paraguay
      'PE': 9, // Peru
      'PH': 10, // Philippines
      'PL': 9, // Poland
      'PT': 9, // Portugal
      'QA': 8, // Qatar
      'RO': 9, // Romania
      'RU': 10, // Russia
      'RW': 9, // Rwanda
      'KN': 10, // Saint Kitts and Nevis
      'LC': 10, // Saint Lucia
      'VC': 10, // Saint Vincent and the Grenadines
      'WS': 5, // Samoa
      'SM': 10, // San Marino
      'ST': 7, // Sao Tome and Principe
      'SA': 9, // Saudi Arabia
      'SN': 9, // Senegal
      'RS': 9, // Serbia
      'SC': 7, // Seychelles
      'SL': 8, // Sierra Leone
      'SG': 8, // Singapore
      'SK': 9, // Slovakia
      'SI': 8, // Slovenia
      'SB': 5, // Solomon Islands
      'SO': 8, // Somalia
      'ZA': 9, // South Africa
      'SS': 9, // South Sudan
      'ES': 9, // Spain
      'LK': 9, // Sri Lanka
      'SD': 9, // Sudan
      'SR': 7, // Suriname
      'SZ': 8, // Swaziland
      'SE': 9, // Sweden
      'CH': 9, // Switzerland
      'SY': 9, // Syria
      'TW': 9, // Taiwan
      'TJ': 9, // Tajikistan
      'TZ': 9, // Tanzania
      'TH': 9, // Thailand
      'TL': 7, // Timor-Leste
      'TG': 8, // Togo
      'TO': 5, // Tonga
      'TT': 10, // Trinidad and Tobago
      'TN': 8, // Tunisia
      'TR': 10, // Turkey
      'TM': 8, // Turkmenistan
      'TV': 5, // Tuvalu
      'UG': 9, // Uganda
      'UA': 10, // Ukraine
      'AE': 9, // United Arab Emirates
      'GB': 10, // United Kingdom
      'US': 10, // United States
      'UY': 8, // Uruguay
      'UZ': 9, // Uzbekistan
      'VU': 5, // Vanuatu
      'VA': 10, // Vatican City
      'VE': 10, // Venezuela
      'VN': 9, // Vietnam
      // Add more countries as needed
    };

    // Default to 10 if country not found
    return phoneLengthMap[code] ?? 10;
  }

  /// Returns full max length including country code (e.g., +91 for India)
  static int getTotalMaxLength(CountryCode countryCode) {
    // Add the length of the country code (e.g., +91 is 3 characters)
    final dialCodeLength = countryCode.dialCode?.length ?? 0;
    return getMaxPhoneLength(countryCode) + dialCodeLength;
  }

  /// Check if a phone number is valid for the specific country
  static bool isValidPhoneNumber(String phoneNumber, CountryCode countryCode) {
    final maxLength = getMaxPhoneLength(countryCode);

    // Remove any dial code prefix if present
    String cleanPhoneNumber = phoneNumber;
    if (countryCode.dialCode != null &&
        phoneNumber.startsWith(countryCode.dialCode!)) {
      cleanPhoneNumber = phoneNumber.substring(countryCode.dialCode!.length);
    }

    // Remove any non-numeric characters
    cleanPhoneNumber = cleanPhoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    // Check if the length is correct
    return cleanPhoneNumber.length == maxLength;
  }
}
