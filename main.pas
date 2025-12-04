program Integrals;
uses Crt;

var 
    current, run: integer;
    key: char;

const 
    N: integer = 3;
    list: array[0..2] of string = ('First', 'Second', 'Third');

procedure renderList();
    var i: integer;
begin
    
    for i := 0 to N-1 do begin
        if i = current then write('--> ');
        
        writeln(list[i]);
    end;
end;

begin
    writeln('Hello World');
    ClrScr;

    { Is program running? }
    run := 1;
    
    { Current list's value index }
    current := 0;
    while run <> 0 do begin
        renderList();
        key := ReadKey;
    
        ClrScr;
        writeln('Test: ');
        { Match arrow keys and enter }
        case key of
            #72: writeln('Up');
            #80: writeln('Down');
            #13: writeln('Enter');
        end;
    end;
    
end.