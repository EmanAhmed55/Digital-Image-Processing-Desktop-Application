function varargout = trois(varargin)
% TROIS MATLAB code for trois.fig
%      TROIS, by itself, creates a new TROIS or raises the existing
%      singleton*.
%
%      H = TROIS returns the handle to a new TROIS or the handle to
%      the existing singleton*.
%
%      TROIS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TROIS.M with the given input arguments.
%
%      TROIS('Property','Value',...) creates a new TROIS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before trois_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to trois_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help trois

% Last Modified by GUIDE v2.5 18-May-2022 17:51:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @trois_OpeningFcn, ...
                   'gui_OutputFcn',  @trois_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before trois is made visible.
function trois_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to trois (see VARARGIN)

% Choose default command line output for trois
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes trois wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = trois_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global originalImage
[rows,cols,m]=size(originalImage);



    


global save;
global out
out=originalImage;
global windowSize
windowSize = 3; % Whatever you want.

global sum  i j k l 
sum =0;
for i=2:rows-1
 for j=2:cols-1
 sum = 0;
            for k = i-1:i+1
                for l = j-1:j+1
                    sum = sum+originalImage(k,l)/windowSize ^ 2;
                  
                end
            end  
            out(i,j)=sum;

            
  end 
 end
 save=out;     
axes(handles.axes2);
imshow(uint8(out));
title("Average Image");


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global out
global save;
global originalImage;
if(out==0)
    x=originalImage
else
    x=out;
end


 x=im2double(out);
 output=x;
 [r c]=size(x);
    for i=2:r-1
       for j=2:c-1
           mat=[x(i-1,j-1),x(i-1,j),x(i-1,j+1),x(i,j-1),x(i,j),x(i,j+1),x(i+1,j-1),x(i+1,j),x(i+1,j+1)];
           
           mat=sort(mat);
           output(i,j)=mat(5);
          
       end
    end 
 save=output;   
 axes(handles.axes2);
 imshow(output)
 title('apply median');


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global out;
global save;
global originalImage;
if(out==0)
    grayImage =originalImage;
else
       grayImage =out;
end

 


gray_image=double(grayImage);
[rows cols noMatrex]= size (gray_image);

mask=[-1 -2 -1;0 0 0;1 2 1];

out=gray_image;
for i=2:rows-1
 for j=2:cols-1
     temp=mask.*gray_image(i-1:i+1,j-1:j+1);
     value=sum(temp(:));
     out(i,j)=value;
 end 
end 
axes(handles.axes2);
imshow(out);
save=out;




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global out;
global originalImage;

if (out==0)
    grayImage=originalImage;
else
   grayImage = out;
end

 


global save;
gray_image=double(grayImage);
[rows cols noMatrex]= size (gray_image);
%Sharp
mask=[0,-1,0;-1,5,-1;0,-1,0];


out=gray_image;
for i=2:rows-1
 for j=2:cols-1
     temp=mask.*gray_image(i-1:i+1,j-1:j+1);
     value=sum(temp(:));
     out(i,j)=value;
 end 
end 
axes(handles.axes2);
imshow(out);
save=out;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
 global image 
 image = strcat(pathname, filename);
global originalImage
originalImage = imread(image);
[r,c,m]=size(originalImage);
if(m==3)
     originalImage=rgb2gray(originalImage);
end

axes(handles.axes1);
imshow(originalImage );
global out;
out=0;



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global save
[baseFileName, folder] = uiputfile({'.jpg';'.bmp';'.jpg';'.jpeg';'*.png'}, 'Specify a file');%open save box (making specify a file 'title'
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName) 
imwrite( save, fullFileName);



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha = axes('units','normalized', ...
            'position',[0 0 1 1]);
% Move the background axes to the bottom
uistack(ha,'bottom');
% Load in a background image and display it using the correct colors
% The image used below, is in the Image Processing Toolbox.  If you do not have %access to this toolbox, you can use another image file instead.
I=imread('back.jpg');
hi = imagesc(I)
colormap gray
% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
% Also, make the axes invisible
set(ha,'handlevisibility','off', ...
            'visible','off')
% Now we can use the figure, as required.
% For example, we can put a plot in an axes
axes('position',[0,0,0,0])
plot(rand(10))


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
project;



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
close;
butterworthhighpassfilter

% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a
a = getappdata(0,'a');
axes(handles.axes1)
imshow(a);
global b
b = getappdata(0,'b');
axes(handles.axes2)
imshow(b);

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global   mask 
global out;
global originalImage;

if (out==0)
    grayImage=originalImage;
else
   grayImage = out;
end
global save;
% displaying the image

gray_image = double(grayImage);
[rows,cols]=size(gray_image);
mask = [0,-1,0;-1,5,-1;0,-1,0];
global output temp value i j
output = gray_image;
for i=2:rows-1
 for j=2:cols-1
     temp = mask.*gray_image(i-1:i+1,j-1:j+1);
     value = sum(temp(:));
     output(i, j)= value;

end
end

axes(handles.axes2);
imshow(output);
out=output;
save=out;
