class SectionData {
  final imgUrl;
  final text;
  final widthPercent;
  final heighPercent;
  final routeContent;
  SectionData(
      {this.imgUrl,
      this.text,
      this.widthPercent,
      this.heighPercent,
      this.routeContent});
}

class SectionList {
  static List<SectionData> listLeft = [
    SectionData(
      imgUrl: 'assets/images/plane.png',
      text: 'Flight',
      routeContent: 'plane',
      widthPercent: 85 * 100 / 414,
      heighPercent: 73 * 100 / 736,
    ),
    SectionData(
      imgUrl: 'assets/images/hotel.png',
      text: 'Hotels',
      routeContent: 'hotel',
      widthPercent: 86 * 100 / 414,
      heighPercent: 73 * 100 / 736,
    ),
    SectionData(
      imgUrl: 'assets/images/tramvai.png',
      text: 'Holidays',
      routeContent: 'holiday',
      widthPercent: 75 * 100 / 414,
      heighPercent: 74 * 100 / 736,
    )
  ];

  static get seclistLeft {
    return [...listLeft];
  }

  static List<SectionData> listRight = [
    SectionData(
      imgUrl: 'assets/images/bus.png',
      text: 'Bus',
      routeContent: 'bus',
      widthPercent: 74 * 100 / 414,
      heighPercent: 73 * 100 / 736,
    ),
    SectionData(
      imgUrl: 'assets/images/car.png',
      text: 'Cabs',
      routeContent: 'car',
      widthPercent: 98 * 100 / 414,
      heighPercent: 66 * 100 / 736,
    ),
    SectionData(
      imgUrl: 'assets/images/train.png',
      text: 'Train',
      routeContent: 'train',
      widthPercent: 74 * 100 / 414,
      heighPercent: 82 * 100 / 736,
    )
  ];

  static get seclistRight {
    return [...listRight];
  }
}
