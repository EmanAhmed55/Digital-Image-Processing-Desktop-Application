function varargout = BitGraySlicing(varargin)
% BITGRAYSLICING MATLAB code for BitGraySlicing.fig
%      BITGRAYSLICING, by itself, creates a new BITGRAYSLICING or raises the existing
%      singleton*.
%
%      H = BITGRAYSLICING returns the handle to a new BITGRAYSLICING or the handle to
%      the existing singleton*.
%
%      BITGRAYSLICING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BITGRAYSLICING.M with the given input arguments.
%
%      BITGRAYSLICING('Property','Value',...) creates a new BITGRAYSLICING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BitGraySlicing_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BitGraySlicing_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BitGraySlicing

% Last Modified by GUIDE v2.5 18-May-2022 23:23:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BitGraySlicing_OpeningFcn, ...
                   'gui_OutputFcn',  @BitGraySlicing_OutputFcn, ...
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


% --- Executes just before BitGraySlicing is made visible.
function BitGraySlicing_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BitGraySlicing (see VARARGIN)

% Choose default command line output for BitGraySlicing
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BitGraySlicing wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BitGraySlicing_OutputFcn(hObject, eventdata, handles) 
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
[filename pathname]=uigetfile({'*.jpg';'*.png'},'File Selector');
global image
image=strcat(pathname,filename);
axes(handles.axes1);
imshow(image);

global original
original=imread(image);
% get size of image
[rows,columns,matrixno]=size(original);
% convert RGB image
if size(image,3)==3
    original=rgb2gray(image);
end
% array of axeses for showing multiple sequence of bits of the image
handles.hAxes=[handles.axes2,handles.axes3,handles.axes4,handles.axes5,handles.axes6,handles.axes7,handles.axes8,handles.axes9];
%creating new image
global newImage
newImage = zeros(rows,columns,8);

for k=1:8
    for row_index=1:rows
        for col_index=1:columns
            newImage(row_index,col_index,k)=bitget(original(row_index,col_index),k);
        end
    end
        imshow(newImage(:,:,k),'parent',handles.hAxes(k)); 
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.prev,'visible','on');
% set(handles.output,'visible','off');
close;
sec;


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
