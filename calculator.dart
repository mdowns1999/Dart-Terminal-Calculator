import 'dart:io';
import 'number.dart';

class Calculator
{
  //Set up List
  var inputValues = [];
  var calcValues = [];
  int intValue = 0;
  String strValue = "";
  Number number = Number();
  String? currentSymbol = "";
  

  /***************************
  * CALCULATE:
  * This method controls the calculations
  ******************************/
void calculate()
{
  //Set the Calculator Loop
  bool done = false;
  // inputValues.add("0");
  display(0);

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
        display(intValue);
      }

      else if(input == "=" || (calcValues.length == 2))
      {
        formatInput(inputValues);
        resetDisplay();
        //print("Our Length is 2!");
      }

      else
      {
      //Here we check if an input is a math symbol.  Based on the input, 
      //we will convert the number to a int then start creating the next input value.
        if (input == "+" || input == "-")
        {
        //print('We have a plus');
        currentSymbol = input;

        formatInput(inputValues);
        resetDisplay();
        }

        else
        {
        inputValues.add(input);
        formatInput(inputValues);
        }
      }
    //Display Screen
    display(intValue);
    //print("Int List: $calcValues");
    //print("Str List: $inputValues");
  }
}

/***************************
* FORMAT INPUT:
* Format input to a stirng and then an int.
******************************/
void formatInput(inputValues)
{
  strValue = formatDisplayValue(inputValues);

  intValue = convertToInteger(strValue);
}

/***************************
* CONVERT TO INTEGER:
* Convert our string value to an integer.
******************************/
int convertToInteger(value)
{
  int numValue = int.parse(value);

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
  print("Your Current Screen is: $value");
}

  /***************************
  * RESET DISPLAY:
  * Reset Display on the Calculator Screen
  ******************************/
void resetDisplay()
{
  //Add Current value to Int Value List
  calcValues.add(intValue);
  //print("reset");
  //print(calcValues.length);

  if (calcValues.length == 2)
  {
    // calcValues[0] = calcValues[0] + calcValues[1];
    // calcValues.removeLast();

    //Call Number to do Calc
    calcValues[0] = number.compute(currentSymbol, calcValues);
    calcValues.removeLast();
    intValue = calcValues[0];
  }



  //Reset String Value List
  inputValues.removeRange(0, inputValues.length);
  inputValues.add("0");
  //print(inputValues);
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
  //print(inputValues);
}
}