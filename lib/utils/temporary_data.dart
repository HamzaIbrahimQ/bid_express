import 'package:bid_express/models/data_models/address/address.dart';
import 'package:bid_express/models/data_models/bids_models/bid_model.dart';
import 'package:bid_express/models/data_models/bids_models/cancelled_bid_model.dart';
import 'package:bid_express/models/data_models/bids_models/history_bid_model.dart';
import 'package:bid_express/models/data_models/bids_models/won_bid_model.dart';

class TemporaryData {
  List<String> rangeDataList = [
    'Last Day',
    'Last Week',
    'Last Month',
    'Last 2 Months',
  ];

  List<String> warrantyDataList = [
    'No Warranty',
    '1 Month',
    '3 Months',
    '6 Months',
    '1 Year',
  ];

  List<BidModel> homeBids = [
    BidModel(
      orderID: 163656,
      carParts: ['Break Pads', 'Wipers'],
      carName: 'Nissan Lief',
      carYear: '2008',
      creationDate: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    BidModel(
      orderID: 145632,
      carParts: ['Break Pads'],
      carName: 'Mercedes Benz',
      carYear: '2016',
      creationDate: DateTime.now().subtract(const Duration(days: 14)),
    ),
    BidModel(
      orderID: 18543,
      carParts: ['Wipers'],
      carName: 'Nissan Lief',
      carYear: '2012',
      creationDate: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    BidModel(
      orderID: 53218,
      carParts: ['Break Pads', 'Wipers'],
      carName: 'Mercedes Benz',
      carYear: '2018',
      creationDate: DateTime.now().subtract(const Duration(days: 10)),
    ),
    BidModel(
      orderID: 124578,
      carParts: ['Wipers'],
      carName: 'Toyota Corolla',
      carYear: '2010',
      creationDate: DateTime.now().subtract(const Duration(days: 45)),
    ),
  ];

  List<BidHistoryModel> homeHisytoyrBids = [
    BidHistoryModel(
        orderID: 163656,
        carParts: ['Break Pads', 'Wipers'],
        carName: 'Nissan Lief',
        carYear: '2008',
        price: 150,
        timeDate: DateTime(2023, 12, 7, 3, 30),
        rateCount: 3),
    BidHistoryModel(
        orderID: 145632,
        carParts: [
          'Break Pads',
        ],
        carName: 'Mercedes Benz',
        carYear: '2016',
        price: 180,
        timeDate: DateTime(2023, 11, 2, 3, 30),
        rateCount: 2),
    BidHistoryModel(
        orderID: 18543,
        carParts: ['Wipers'],
        carName: 'Nissan Lief',
        carYear: '2012',
        price: 200,
        timeDate: DateTime(2024, 1, 7, 3, 30),
        rateCount: 4.5),
    BidHistoryModel(
        orderID: 53218,
        carParts: ['Break Pads', 'Wipers'],
        carName: 'Mercedes Benz',
        carYear: '2018',
        price: 250,
        timeDate: DateTime(2023, 5, 26, 3, 30),
        rateCount: 1),
    BidHistoryModel(
        orderID: 124578,
        carParts: ['Wipers'],
        carName: 'Toyota Corolla',
        carYear: '2010',
        price: 500,
        timeDate: DateTime(2023, 6, 8, 3, 30),
        rateCount: 2),
  ];
  List<BidCancelledModel> homeBidsCancelled = [
    BidCancelledModel(
        orderID: 163656,
        carParts: ['Break Pads', 'Wipers'],
        carName: 'Nissan Lief',
        carYear: '2008',
        reasonCancelled:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        timaDate: DateTime(2023, 11, 8, 3, 30)),
    BidCancelledModel(
        orderID: 145632,
        carParts: [
          'Break Pads',
        ],
        carName: 'Mercedes Benz',
        carYear: '2016',
        reasonCancelled:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        timaDate: DateTime(2023, 12, 7, 3, 30)),
    BidCancelledModel(
        orderID: 18543,
        carParts: ['Wipers'],
        carName: 'Nissan Lief',
        carYear: '2012',
        reasonCancelled:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        timaDate: DateTime(2024, 1, 8, 3, 30)),
    BidCancelledModel(
        orderID: 53218,
        carParts: ['Break Pads', 'Wipers'],
        carName: 'Mercedes Benz',
        carYear: '2018',
        reasonCancelled:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        timaDate: DateTime(2023, 11, 25, 3, 30)),
    BidCancelledModel(
        orderID: 124578,
        carParts: ['Wipers'],
        carName: 'Toyota Corolla',
        carYear: '2010',
        reasonCancelled:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        timaDate: DateTime(2023, 2, 1, 3, 30)),
  ];
  List<WonBidModel> homeWonBids = [
    WonBidModel(
        orderID: 163656,
        carParts: ['Break Pads', 'Wipers'],
        carName: 'Nissan Lief',
        carYear: '2008',
        price: 150,
        name: 'Ahmad',
        phoneNumber: '+962780780780',
        image: 'https://picsum.photos/200',
        timaDate: DateTime(2023, 11, 8, 3, 30)),
    WonBidModel(
        orderID: 145632,
        carParts: [
          'Break Pads',
        ],
        carName: 'Mercedes Benz',
        carYear: '2016',
        price: 140,
        name: 'Anas',
        phoneNumber: '+962790790794',
        image: 'https://picsum.photos/200',
        timaDate: DateTime(2024, 1, 5, 12, 30)),
    WonBidModel(
        orderID: 18543,
        carParts: ['Wipers'],
        carName: 'Nissan Lief',
        carYear: '2012',
        price: 200,
        name: 'Adam',
        phoneNumber: '+962770770771',
        image: 'https://picsum.photos/200',
        timaDate: DateTime(2023, 11, 20, 6, 30)),
    WonBidModel(
        orderID: 53218,
        carParts: ['Break Pads', 'Wipers'],
        carName: 'Mercedes Benz',
        carYear: '2018',
        price: 250,
        name: 'Noor',
        phoneNumber: '+962780780788',
        image: 'https://picsum.photos/200',
        timaDate: DateTime(2023, 12, 16, 3, 30)),
    WonBidModel(
        orderID: 124578,
        carParts: ['Wipers'],
        carName: 'Toyota Corolla',
        carYear: '2010',
        price: 225,
        name: 'Labeeb',
        phoneNumber: '+96277855216',
        image: 'https://picsum.photos/200',
        timaDate: DateTime(2024, 2, 5, 4, 30)),
  ];

  List<Address> addresses = [
    Address(
      id: '1655313',
      coordinates: '5215621.2156 , 52156325.52',
      name: 'Home',
      city: 'Amman',
      area: 'Area 1 ',
      street: 'salman alfarisy Street',
      building: 'building',
    ),
    Address(
      id: '541354312',
      coordinates: '96512.2156 , 6321585.52',
      name: 'Work',
      city: 'Zarqa',
      area: 'Area 1 ',
      street: 'Al Munawwarah Street',
      building: 'building',
    ),
  ];
}

TemporaryData tData = TemporaryData();
