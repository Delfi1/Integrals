program Integrals;
uses Crt;

var
  current, run: integer;
  i: integer;
  a, b, c, step: double;
  S, x, y0, y1, delta, eps: double;
  key: char;

const
  x_zero: double = -1.203;
  N: integer = 4;
  list: array[0..3] of string = ('Set limits', 'Set step', 'Execute', 'Exit');

procedure setLimits;
begin
  ClrScr;
  write('Enter integration bounds (a and b): ');
  readln(a, b);

  if a > b then begin
    c := a;
    a := b;
    b := c;
  end;

  if a < x_zero then a := x_zero;
  if b < x_zero then b := x_zero;
end;

procedure setStep;
begin
  ClrScr;
  write('Enter step (positive value): ');
  readln(step);

  if step <= 0 then begin
    writeln('Error: Step must be greater than zero!');
    ReadKey;
    step := 0;
  end;
end;

function exactF(v: double): double;
begin
  exactF := (v*v*v*v / 4) - (v*v*v / 3) + (2*v*v) + (8*v);
end;

function executeF(v: double): double;
begin
  executeF := v*v*v -v*v + 4*v + 8;
end;

procedure executeIntegral;
var exactS: double;
begin
  x := a;

  exactS := exactF(b) - exactf(a);

  S := 0;
  while x < b do begin
    y0 := executeF(x);
    x += step;
    y1 := executeF(x);

    S += (y0 + y1) * step / 2;
  end;

  exactS := exactF(b) - exactF(a);
  delta := abs(S - exactS);
  if abs(S) > 0.0001 then
    eps := (delta/exactS)*100
  else
    eps := 0;

  writeln('Integration results:');
  writeln('Exact S: ', exactS:0:5);
  writeln(S:0:5);

  writeln('Absolute error: ', delta:0:5);
  writeln('Relative error: ', eps:0:2, '%');
  writeln('Press any key to return to menu...');
end;

begin
  run := 1;
  current := 0;
  a := 0; b := 0;
  while run <> 0 do begin
    ClrScr;

    writeln('Function: f(x) = x^3 - x^2 + 4x + 8');
    writeln('Root: ', x_zero:0:4);
    writeln('Current limits: a = ', a:0:2, ', b = ', b:0:2);
    writeln('Current step: ', step:0:5);
    writeln('------------------------------------');

    for i := 0 to N-1 do begin
      if i = current then write(' --> ') else write('     ');
      writeln(list[i]);
    end;

    key := ReadKey;
    case key of
      #72, #38: current := (current - 1 + N) mod N; { Стрелка вверх }
      #80, #40: current := (current + 1) mod N;     { Стрелка вниз }
      #13: begin { Enter }
        case current of
          0: setLimits;
          1: setStep;
          2: begin
                if step > 0.0001 then executeIntegral
                else writeln('Error: Set step first!');
                ReadKey;
             end;
          3: run := 0;
        end;
      end;
    end;
  end;
end.
