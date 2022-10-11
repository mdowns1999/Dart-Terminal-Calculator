import 'dart:io';
import 'number.dart';

class Calculator
{
  //Set up List
  var inputValues = [];
  var calcValues = [];
  double doubleValue = 0;
  String strValue = "";
  Number number = Number();
  String? prevInput = "";
  String? prevSymbol = "";
  String? currentSymbol = "";
  

  /***************************
  * CALCULATE:
  * This method controls the calculations
  ******************************/
void calculate()
{
  //Set the Calculator Loop
  bool done = false;
  display(0);
  inputValues.add("0");

  while(!done)
  {
    //Get User Input
    String? input = stdin.readLineSync();


      //If User "Turns off"
      if(input == "done")
      {
        done = true;
      }

      //If User wants to clear the calculator
      else if(input == "clear")
      {
        clear();
      }

      else
      {
      //Here we check if an input is a math symbol.  Based on the input, 
      //we will convert the number to a int then start creating the next input value.
        if (isOperator(input))
        {
          //Record the Symbol
          prevSymbol = currentSymbol;
          currentSymbol = input;

          if(input == "=" || (calcValues.length == 2))
            {
              formatInput(inputValues);
              resetDisplay();
            }

          else if(prevSymbol == "=" &&  isOperator(prevInput) == false && isOperator(input) == true)
            {

              calcValues.remove(calcValues[0]);
              inputValues.add("0");
            }

          else
          {

            resetDisplay();

          }

        resetDisplay();
        }

        else
        {
        inputValues.add(input);
        }

        //If it is not a symbol, format th e string
        formatInput(inputValues);
        
      }
    //Display Screen
    if(doubleValue == 0)
      doubleValue = calcValues[0];
    display(doubleValue);
    
      //display(intValue);


    prevInput = input;
    print("Int List: $calcValues");
    print("Str List: $inputValues");
  }
}

/***************************
* FORMAT INPUT:
* Format input to a stirng and then an int.
******************************/
void formatInput(inputValues)
{
  //This will concate our string list.
  strValue = formatDisplayValue(inputValues);

  //This will convert the string to an int
  doubleValue = convertToDouble(strValue);
}

/***************************
* CONVERT TO INTEGER:
* Convert our string value to an integer.
******************************/
double convertToDouble(value)
{
  double numValue = double.parse(value);

  return numValue ;
}


/***************************
* FORMAT DISPLAY VALUE:
* Combine the numbers in our list
******************************/
String formatDisplayValue(inputs)
{
  String value1 = "";

    for(int i = 0; i < inputs.length; i++)
  {
    value1 = value1 + inputs[i];
  }

  return value1;

}


  /***************************
  * DISPLAY:
  * Display the Calculator Screen
  ******************************/
  void display(value)
{
    //Display 'Screen'
  print("----------------------");
  print("Your Current Screen is: $value");
  print("----------------------");
}

  /***************************
  * RESET DISPLAY:
  * Reset Display on the Calculator Screen
  ******************************/
void resetDisplay()
{

  //Add Current value to Int Value List
  if(inputValues.length >= 2)
  {
      calcValues.add(doubleValue);
      doubleValue = calcValues[0];
      // print('RESET calc Values: $calcValues');
  }

  //print("reset");
  // print(calcValues.length);
  if (calcValues.length == 2)
  {

    //Call Number to do Calc
    calcValues[0] = number.compute(prevSymbol, calcValues);
    calcValues.removeLast();
    doubleValue = calcValues[0];
    print('intValue: $doubleValue');
  }


  // print('Before Str Values: $inputValues');
  //Reset String Value List
  inputValues.removeRange(0, inputValues.length);
  inputValues.add("0");
  doubleValue = calcValues[0];

  print("OUTPUT: $doubleValue");
  }



  /***************************
  * Clear:
  * Clear Everything
  ******************************/
void clear()
{
  //Reset Int Value List
  calcValues.removeRange(0, calcValues.length);
  //print(calcValues);


  //Reset String Value List
  inputValues.removeRange(0, inputValues.length);

  //Reset the Values
  inputValues.add("0");
  doubleValue = 0;
  prevSymbol = "";
  currentSymbol = "";
  prevInput = "";
}

bool isOperator(input)
{
  if(input == "+" || input == "-" || input == "*" || input == "/" || input == "=")
  return true;
  else
  return false;
}
}