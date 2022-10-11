class Number{
  double total = 0;

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
* Multiply:
* Multiply values
******************************/
void multiply(calcValues)
{
  total = calcValues[0] * calcValues[1];
}

/***************************
* Divide:
* Divide values
******************************/
void divide(calcValues)
{
  total = calcValues[0] / calcValues[1];
}

/***************************
* COMPUTE:
* THis method figures out what math it needs to do.
******************************/
double compute(symbol,calcValues)
{
  print("Current Number Symbol: $symbol");

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
    case "*":
    {
      multiply(calcValues);
      break;
    }
    case "/":
    {
      divide(calcValues);
      break;
    }


  }


  return total;
}


}