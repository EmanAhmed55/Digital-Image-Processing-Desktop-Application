
[filename, pathname] = uigetfile({'.jpg';'.*'},'File Selector');
 global image 
 image = strcat(pathname, filename);
global originalImage
originalImage = imread(image);
axes(handles.axes1);
imshow(originalImage )  
 
range2=str2double(get(handles.edit2,'string'));
 
axes(handles.axes2);
imshow(img2);
-------------------------
project_OpeningFcn
handles.output=hObject;
 handles.s1=sec; %load second gui
h1=guidata (handles.s1); %save it in h1
h1.prev=hObject; %load this gui when back 
guidata(handles.s1,h1); %load values when pressing 
guidata (hObject, handles);
 set(handles.s1,'visible','off'); %hide second when this gui is opened



in pushbutton next :
set(handles.output,'visible','off');
set(handles.s1,'visible','on');

in back:
set(handles.prev,'visible','on');
set(handles.output,'visible','off');
---------------------
if else ...more than one button
global x;

if x==8
     handles.s1=thresholdapp; %load second gui
else if x==7
     handles.s1=greylevel;
     
else if x==2
     handles.s1=resamplingupp;
     
else if x==3
          handles.s1=Negative_img; 
    else if x==5
              handles.s1=Log;  
        else if x==9
                handles.s1=firstapp;
            else if x==11
                    handles.s1=BitGraySlicing;
                    
            else if x==12
                    handles.s1=add;
                        
            else if x==13
                    handles.s1=subtract_num_from_imgfig;       
          else if x==14
                    handles.s1=untitled1; 
                    
          else if x==19
                    handles.s1=Histogram; 
                    
           else if x==20
                    handles.s1=hisogram_E;                 
                
         else
        
         
    
            end  
    end
    
end
    
end
    end
    end

    end
    end
    end
    end
    end
end

h1=guidata (handles.s1); %save it in h1
h1.prev=hObject; %load this gui when back 
guidata(handles.s1,h1); %load values when pressing 
guidata (hObject, handles);
 set(handles.s1,'visible','off'); %hide second when this gui is opened

% Choose default command line output for sec
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

--------------

at button :
global x;
x=3;
 handles.s1=Negative_img; 
set(handles.output,'visible','off');
set(handles.s1,'visible','on');






