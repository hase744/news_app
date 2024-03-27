import pyopenjtalk
import numpy as np
import argparse
import cv2
from scipy.io import wavfile
from moviepy.editor import *
from PIL import ImageFont, ImageDraw, Image

def inputJP(name, img, text, x, y, size, color, output):
  font = ImageFont.truetype('ipam.ttf', size)
  img_pil = Image.fromarray(img)
  draw = ImageDraw.Draw(img_pil)
  draw.text((x, y), text, font=font, fill=color)
  output_img = np.array(img_pil)
  if output == 1:
    cv2.imshow(name, output_img)
    cv2.waitKey(1)

  return output_img

def create_video(id, text, category, output_path, file_name):
  x, sr = pyopenjtalk.tts(text)
  print(f'sr : {sr}')
  #sr = 16000
  wavfile.write(f'public/audios/{file_name}.mp3', sr, x.astype(np.int16))
  # WAVファイルの再生時間を計算
  duration = len(x) / sr
  print("WAVファイルの再生時間:", duration, "秒")

  # 1. 画像の読み込み
  print(category)
  image_path = f'public/{category}.jpg'
  image = cv2.imread(image_path, cv2.IMREAD_COLOR)
  #cv2.imwrite('public/images/image.jpg',image)
  height, width, _ = image.shape

  font = cv2.FONT_HERSHEY_SIMPLEX
  #font = ImageFont.truetype('ヒラギノ丸ゴ ProN W4.ttc', 24)
  font_scale = 5
  font_thickness = 10
  text_color = (255, 255, 255)  # 白色
  split_count = 20
  text_size = int(width/split_count)#cv2.getTextSize(text, font, font_scale, font_thickness)[0]
  text_x = 0 #int((width - text_size) / 2)
  text_y = height - text_size*2

  # 3. 動画のフレーム生成
  frames = []
  text_count = split_count
  print(text_count)
  split_text = [text[i:i+split_count] for i in range(0, len(text), split_count)]
  #duration = 10  # 動画の長さ（秒）
  fps = len(split_text)/duration  
  print("OK")
  for text_unit in split_text:# フレームレート
      frame = inputJP("Frame", cv2.cvtColor(image, cv2.COLOR_RGB2BGR), text_unit, text_x, text_y, text_size, text_color, 0)
      frames.append(frame)
      
  # 4. 動画の生成
  output_video_path = f'{output_path}/{file_name}.mp4'
  audio_clip = AudioFileClip(f'public/audios/{file_name}.mp3')
  audio_clip = audio_clip.volumex(0.5)
  clip = ImageSequenceClip(frames, fps=fps)
  clip = clip.set_audio(audio_clip)
  clip.write_videofile(output_video_path, codec="libx264")

  text_x = 0
  text_y = text_size
  image_with_title = inputJP("Frame", image, text, text_x, text_y, text_size, text_color, 0)
  cv2.imwrite(f'public/images/{file_name}.jpg', image_with_title)

  print("動画が生成されました:", output_video_path)

if __name__ == "__main__":
  parser = argparse.ArgumentParser(description="video ceator")
  parser.add_argument("id", help="YouTube video URL")
  parser.add_argument("-c", "--category", help="category name")
  parser.add_argument("-t", "--text", help="YouTube video URL")
  parser.add_argument("-o", "--output", help="Output directory path", default=".")
  parser.add_argument("-f", "--filename", help="Output filename (without extension)", default="video")

  args = parser.parse_args()
  try:
    create_video(args.id, args.text, args.category , args.output, args.filename)
  except Exception as e:
    print("エラーが発生しました:", e)