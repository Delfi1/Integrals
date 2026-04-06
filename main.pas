program Integrals;
uses Crt;

var
  current, run: integer;

  i, lm, st: integer;
  a, b, step: double;
  S, S0, x, y0, y1, delta, eps: double;

  key: char;

const
  x_zero: double = -1.203;
  N: integer = 4;
  list: array[0..3] of string = ('Set limits', 'Set step', 'Execute', 'Exit');

procedure setLimits;
begin
  ClrScr;

  write('Bounds of integration: ');
  readln(a, b);

  if x_zero > a then a := x_zero;
  if x_zero > b then b := x_zero;

  lm := 1;
end;

procedure setStep;
begin
  ClrScr;

  write('Step of integration: ');
  readln(step);

  if step < 0 then begin
    writeln('Step is lower then zero!');
    exit;
  end;
  st := 1;
end;

function executeF: double;
begin
  executeF := x*x*x -x*x + 4*x + 8;
end;

procedure executeIntegral;
begin
  x := a;

  S := 0;
  while x < b do begin
    y0 := executeF;

    x += step;
    y1 := executeF;

    if (y0 > 0) and (y1 > 0) then S += (y0 + y1) * step / 2;
  end;
end;


procedure executeAccuracy;
begin
  step := step / 2;
  executeIntegral;

  delta := Abs(S0 - S)/3;
  eps := (delta*100) / S;

  writeln('Result: ');
  writeln(S:2:2, ' +- ', delta:2:2);
  writeln(S:2:2, ' +- ', eps:2:2, '%');
end;

begin
  ClrScr;

  run := 1;
  lm := 0;
  st := 0;

  current := 0;
  while run <> 0 do begin
    ClrScr;

    for i := 0 to N-1 do begin
      if i = current then write('--> ');
      writeln(list[i]);
    end;
    key := ReadKey;

    case key of
      #72: current -= 1;
      #80: current += 1;
      #13: begin
        writeln();

        case current of
          0: setLimits;
          1: setStep;
          2: begin
            if lm <> 1 then begin
              writeln('Function limits are not initialized');
              key := ReadKey;
            end else if st <> 1 then begin
              writeln('Function step is not initialized');
            end else
              executeIntegral;
              S0 := S;
              executeAccuracy;

              key := ReadKey;
          end;
          3: run := 0;
        end;
      end;
    end;

    current := (current + N) mod N;
  end;

end.
