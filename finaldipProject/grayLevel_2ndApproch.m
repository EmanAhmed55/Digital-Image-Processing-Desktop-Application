function varargout = grayLevel_2ndApproch(varargin)
% GRAYLEVEL_2NDAPPROCH MATLAB code for grayLevel_2ndApproch.fig
%      GRAYLEVEL_2NDAPPROCH, by itself, creates a new GRAYLEVEL_2NDAPPROCH or raises the existing
%      singleton*.
%
%      H = GRAYLEVEL_2NDAPPROCH returns the handle to a new GRAYLEVEL_2NDAPPROCH or the handle to
%      the existing singleton*.
%
%      GRAYLEVEL_2NDAPPROCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GRAYLEVEL_2NDAPPROCH.M with the given input arguments.
%
%      GRAYLEVEL_2NDAPPROCH('Property','Value',...) creates a new GRAYLEVEL_2NDAPPROCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before grayLevel_2ndApproch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to grayLevel_2ndApproch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help grayLevel_2ndApproch

% Last Modified by GUIDE v2.5 17-May-2022 18:24:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @grayLevel_2ndApproch_OpeningFcn, ...
                   'gui_OutputFcn',  @grayLevel_2ndApproch_OutputFcn, ...
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


% --- Executes just before grayLevel_2ndApproch is made visible.
function grayLevel_2ndApproch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to grayLevel_2ndApproch (see VARARGIN)

% Choose default command line output for grayLevel_2ndApproch
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes grayLevel_2ndApproch wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = grayLevel_2ndApproch_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
 [filename, pathname] = uigetfile({'*.jpg';'*.bmp';'*.png'},'File Selector');
    global image 
    image = strcat(pathname, filename);
    global originalImage
    originalImage = imread(image);
    axes(handles.axes1);
    imshow(originalImage )


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
  global originalImage
  global x;
  x=originalImage;
  [h w]=size(originalImage);
  for i=1:h
      for j=1:w
          if originalImage(i,j)>100 && originalImage(i,j)<=150
              x(i,j)=255;
          else
              x(i,j)=originalImage(i,j);
          end
      end
  end
  
  axes(handles.axes2);
  imshow(x);
          
 
 
 
 


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
open('sec.fig');


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
global x
[baseFileName, folder] = uiputfile({'.jpg';'.bmp';'.jpg';'.jpeg';'*.png'}, 'Specify a file');%open save box (making specify a file 'title'
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName) 
imwrite( x, fullFileName);
