function varargout = cotrast(varargin)
% COTRAST MATLAB code for cotrast.fig
%      COTRAST, by itself, creates a new COTRAST or raises the existing
%      singleton*.
%
%      H = COTRAST returns the handle to a new COTRAST or the handle to
%      the existing singleton*.
%
%      COTRAST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COTRAST.M with the given input arguments.
%
%      COTRAST('Property','Value',...) creates a new COTRAST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cotrast_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cotrast_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cotrast

% Last Modified by GUIDE v2.5 17-May-2022 21:21:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cotrast_OpeningFcn, ...
                   'gui_OutputFcn',  @cotrast_OutputFcn, ...
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


% --- Executes just before cotrast is made visible.
function cotrast_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cotrast (see VARARGIN)

% Choose default command line output for cotrast
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cotrast wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cotrast_OutputFcn(hObject, eventdata, handles) 
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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
 global image 
 image = strcat(pathname, filename);
global originalImage
originalImage = imread(image);
axes(handles.axes1);
imshow(originalImage );


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global newimg s_min s_max r_max r_min originalImage
[rows, cols ,noMatrex]= size (originalImage);

newimg =zeros (rows, cols);
s_max=str2double(get(handles.edit1,'string'));
s_min=str2double(get(handles.edit2,'string'));


 r_max=max(originalImage,[],'all');
 r_min=min(originalImage,[],'all');

 
 newimg=( ((s_max-s_min)./(r_max-r_min)).*(originalImage-r_min))+s_min;
 


 axes(handles.axes2);

imshow(uint8(newimg));

title('processed Image');



%   global originalImage itemp rtemp s_min s_max i rmin rmax m c;
%     itemp =originalImage;
% s_max=str2double(get(handles.edit1,'string'));
% s_min=str2double(get(handles.edit2,'string'));
% 
%   %read the image
%       i = itemp(:,:,1);
%         rtemp = min(i);         % find the min. value of pixels in all the 
%      %  columns (row vector)
%         rmin = min(rtemp);      % find the min. value of pixel in the image
%         rtemp = max(i);         % find the max. value of pixels in all the 
%       % columns (row vector)
%        rmax = max(rtemp);      % find the max. value of pixel in the image
%        m = s_max-s_min/(rmax - rmin);  % find the slope of line joining point 
%      % (0,255) to (rmin,rmax)
%        c = 255 - m*rmax;       % find the intercept of the straight line 
%      %  with the axis
%      global i_new;
%        i_new = m*i + c;        % transform the image according to new slope
%          % display original image
%       axes(handles.axes2);
% 
% imshow(i_new);




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i_new
[baseFileName, folder] = uiputfile({'.jpg';'.bmp';'.jpg';'.jpeg';'*.png'}, 'Specify a file');%open save box (making specify a file 'title'
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName) 
imwrite( i_new, fullFileName);




% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
open('sec.fig');
