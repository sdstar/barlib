//+------------------------------------------------------------------+
//|                                                       barlib.mqh |
//|                        Copyright 2023, MetaQuotes Software Corp. |
//|                                        https://github.com/sdstar |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, MetaQuotes Software Corp."
#property link      "https://github.com/sdstar"
#property strict
//+------------------------------------------------------------------+
//| defines                                                          |
//+------------------------------------------------------------------+
// #define MacrosHello   "Hello, world!"
// #define MacrosYear    2010
//+------------------------------------------------------------------+
//| DLL imports                                                      |
//+------------------------------------------------------------------+
// #import "user32.dll"
//   int      SendMessageA(int hWnd,int Msg,int wParam,int lParam);
// #import "my_expert.dll"
//   int      ExpertRecalculate(int wParam,int lParam);
// #import
//+------------------------------------------------------------------+
//| EX5 imports                                                      |
//+------------------------------------------------------------------+
// #import "stdlib.ex5"
//   string ErrorDescription(int error_code);
// #import
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//| The Length Of Bar                                                |
//+------------------------------------------------------------------+
double iBarLength(string symbol,     // symbol
                  int    timeframe,  // timeframe
                  int    shift       // shift
                 ){
                     double high = iHigh(symbol,timeframe,shift);
                     double low  = iLow(symbol,timeframe,shift);
                     
                     
                     double barLength = high - low;
                     
                     return barLength;
                   
                  }

//+------------------------------------------------------------------+
//| The Length Of Bar's Body                                         |
//+------------------------------------------------------------------+
double iBodyLenght(string symbol,    // symbol
                  int    timeframe,  // timeframe
                  int    shift       // shift
                 ){
                     double open  = iOpen(symbol,timeframe,shift);
                     double close = iClose(symbol,timeframe,shift);
                     
                     
                     double bodyLength = MathAbs(open - close);
                     
                     return bodyLength;
                  }
                  
//+------------------------------------------------------------------+
//| The Length Of Upper Shadow                                       |
//+------------------------------------------------------------------+
double iUpperShadow(string symbol,     // symbol
                    int    timeframe,  // timeframe
                    int    shift       // shift
                   ){
                       double high  = iHigh(symbol,timeframe,shift);
                       double open  = iOpen(symbol,timeframe,shift);
                       double close = iClose(symbol,timeframe,shift);
                     
                     
                       double upperShadow = 0;
                     
                       if(close >= open) upperShadow = high - close;
                       if(open > close)  upperShadow = high - open;
                     
                       return upperShadow;
                    }
                    
//+------------------------------------------------------------------+
//| The Length Of Lower Shadow                                       |
//+------------------------------------------------------------------+
double iLowerShadow(string symbol,     // symbol
                    int    timeframe,  // timeframe
                    int    shift       // shift
                   ){
                       double low  = iLow(symbol,timeframe,shift);
                       double open  = iOpen(symbol,timeframe,shift);
                       double close = iClose(symbol,timeframe,shift);
                     
                     
                       double lowerShadow = 0;
                     
                       if(close >= open) lowerShadow = open - low;
                       if(open > close)  lowerShadow = close - low;
                     
                       return lowerShadow;
                    }
                    
//+------------------------------------------------------------------+
//| The Midpoint Of Bar                                              |
//+------------------------------------------------------------------+
double iBarMidpoint(string symbol,     // symbol
                    int    timeframe,  // timeframe
                    int    shift       // shift
                   ){
                       double barMidpoint = iMA(symbol,timeframe,1,0,MODE_SMA,PRICE_MEDIAN,shift);
                       
                       return barMidpoint;
                    }
                       
                  
