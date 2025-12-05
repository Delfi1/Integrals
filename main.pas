program Integrals;
uses Crt;

var 
    current, run: integer;
    key: char;
    a, b, step: double;
    
    { Limit and steps initalized flags }
    lm, st: integer;

const 
    N: integer = 4;
    list: array[0..3] of string = ('Set limits', 'Set step', 'Execute', 'Exit');

procedure setLimits;
begin
    ClrScr;

    write('Limits of integration: ');
    readln(a, b);
    lm := 1;
end;

procedure setStep;
begin
    ClrScr;

    write('Step of integration: ');
    readln(step);
    st := 1;
end;

procedure renderList;
    var i: integer;
begin
    for i := 0 to N-1 do begin
        if i = current then write('--> ');
        
        writeln(list[i]);
    end;
end;

procedure executeIntegral;
begin
    if lm <> 1 then begin
        writeln('Function limits are not initialized');
        key := ReadKey;
    end else if st <> 1 then begin
        writeln('Function step is not initialized');
    end else begin
        writeln('Success!');
    end;

    key := ReadKey;
end;

procedure proceedCurrent;
begin
    writeln();

    case current of
        0: setLimits;
        1: setStep;
        2: executeIntegral;
        3: run := 0;
    end;
end;

begin
    ClrScr;
    { Is program running? }
    run := 1;
    lm := 0;
    st := 0;
    
    { Current list's value index }
    current := 0;
    while run <> 0 do begin
        ClrScr;

        renderList;
        key := ReadKey;    

        { Match arrow keys and enter }
        case key of
            #72: current -= 1;
            #80: current += 1;
            #13: proceedCurrent;
        end;

        current := (current + N) mod N;
    end;
end.