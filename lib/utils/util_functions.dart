 String formatDate(DateTime date){
    return "${formatNumber(date.day)} ${getMonth(date.month)} ${date.year}, ${formatNumber(date.hour)}:${formatNumber(date.minute)}";
  }

  String formatNumber(int number){
    return number > 9? "$number" : "0$number";
  }

  String getMonth(int month){
    switch (month) {
      case 1:
        return "Janvier";
      case 2:
        return "Février";
      case 3:
        return "Mars";
      case 4:
        return "Avril";
      case 5:
        return "Mai";
      case 6:
        return "Juin";
      case 7:
        return "Juiller";
      case 8:
        return "Août";
      case 9:
        return "Septembre";
      case 10:
        return "Octobre";
      case 11:
        return "Novembre";
      case 12:
        return "Décembre";
      default: 
      return "Janvier";
    }
  }

  //TODO: Add date formater for notifications