function varargout = thresholdapp(varargin)
% THRESHOLDAPP MATLAB code for thresholdapp.fig
%      THRESHOLDAPP, by itself, creates a new THRESHOLDAPP or raises the existing
%      singleton*.
%
%      H = THRESHOLDAPP returns the handle to a new THRESHOLDAPP or the handle to
%      the existing singleton*.
%
%      THRESHOLDAPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THRESHOLDAPP.M with the given input arguments.
%
%      THRESHOLDAPP('Property','Value',...) creates a new THRESHOLDAPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before thresholdapp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to thresholdapp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help thresholdapp

% Last Modified by GUIDE v2.5 17-May-2022 15:38:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @thresholdapp_OpeningFcn, ...
                   'gui_OutputFcn',  @thresholdapp_OutputFcn, ...
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


% --- Executes just before thresholdapp is made visible.
function thresholdapp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to thresholdapp (see VARARGIN)

% Choose default command line output for thresholdapp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes thresholdapp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = thresholdapp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.

%       See ISPC and COMPUTER.
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
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [filename, pathname] = uigetfile({'.jpg';'.*'},'File Selector');
 global image 
 image = strcat(pathname, filename);
global originalImage
originalImage = imread(image);
axes(handles.axes1);
imshow(originalImage )  


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global originalImage;
a=originalImage;

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% img=imread('image.png');
%   
%    img=double(originalImage);
%     sum=0;
%     for x2=1:r
%          for j=1:c
%         sum=sum+img(x2, j);
%          end
%     end
%     
%   
%     % Calculate Threshold value by dividing the
%     % calculated sum by total number of pixels
%     % total number of pixels = rows*columns (i.e x*y)
%     threshold=sum/(r*c);
% 

% threshold=str2double(get(handles.edit1,'string'));
% 
% 
% for i=1:r
%     for x=1:c
%         if (originalImage(i,x)<=threshold)
%            y (i,x)=0;
%             
%         else
%             y(i,x)=1;
%             
%         end
%     end
% end
% 
% axes(handles.axes2);
% imshow(y);
a=rgb2gray(a);
imshow(a);
t=str2double(get(handles.edit1,'string'));
% 
[m,n]=size(a); %assign size a to m and n

for i=1:m %1 to m
for j=1:n %1 to n
if a(i,j)<=128 %pixel value less than 128
b(i,j)=0; % threshold image will be 0
else
b(i,j)=255; %other value – threshold image will be 255
end
end
end

 axes(handles.axes2);
 imshow(b);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.prev,'visible','on');
% set(handles.output,'visible','off');
close;
open('sec.fig');
