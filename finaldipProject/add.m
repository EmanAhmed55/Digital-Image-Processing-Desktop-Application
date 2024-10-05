function varargout = add(varargin)
% ADD MATLAB code for add.fig
%      ADD, by itself, creates a new ADD or raises the existing
%      singleton*.
%
%      H = ADD returns the handle to a new ADD or the handle to
%      the existing singleton*.
%
%      ADD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADD.M with the given input arguments.
%
%      ADD('Property','Value',...) creates a new ADD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before add_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to add_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help add

% Last Modified by GUIDE v2.5 17-May-2022 17:26:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @add_OpeningFcn, ...
                   'gui_OutputFcn',  @add_OutputFcn, ...
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


% --- Executes just before add is made visible.
function add_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to add (see VARARGIN)

% Choose default command line output for add
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes add wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = add_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
 global image 
 image = strcat(pathname, filename);
global originalImage
originalImage = imread(image);
axes(handles.axes1);
imshow(originalImage);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function add_edit_Callback(hObject, eventdata, handles)
% hObject    handle to add_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of add_edit as text
%        str2double(get(hObject,'String')) returns contents of add_edit as a double


% --- Executes during object creation, after setting all properties.
function add_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to add_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global originalImage
global AddImage
global x
x=str2double(get(handles.add_edit,'string'));
gray_image = rgb2gray(originalImage); 
AddImage = gray_image+x;
axes(handles.axes2)
global s;
s=AddImage;

imshow(AddImage);
title('ADDING');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.prev,'visible','on');
% set(handles.output,'visible','off');
close;
open('sec.fig');


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;

[baseFileName, folder] = uiputfile({'.jpg';'.bmp';'.jpg';'.jpeg';'*.png'}, 'Specify a file');%open save box (making specify a file 'title'
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName) 
imwrite( s, fullFileName);



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
