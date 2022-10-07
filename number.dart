class Number{
  int total = 0;

/***************************
* ADDITION:
* Adds values
******************************/
void addition(calcValues)
{
  total = calcValues[0] + calcValues[1];
}

/***************************
* Subtract:
* Subtract values
******************************/
void subtract(calcValues)
{
  total = calcValues[0] - calcValues[1];
}

/***************************
* COMPUTE:
* THis method figures out what math it needs to do.
******************************/
int compute(symbol,calcValues)
{
  //print("Current Symbol: $symbol");

  switch(symbol)
  {
    case "+":
    {
      addition(calcValues);
      break;
    }

    case "-":
    {
      subtract(calcValues);
      break;
    }


  }


  return total;
}


}