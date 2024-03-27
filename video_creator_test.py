import pyopenjtalk
import numpy as np
#import requests
import cv2
from scipy.io import wavfile
from moviepy.editor import *
from PIL import ImageFont, ImageDraw, Image

text = """内閣改造において、政府は異例の人事を発表し、元宇宙飛行士である加藤太郎氏を新たな外務大臣に任命することを発表しました。この人事は、日本の外交政策に新たな視点を取り入れるためのものであり、国内外から大きな注目を集めています。

加藤氏は、かつて国際宇宙ステーションでの長期滞在経験を持つ宇宙飛行士として知られており、その間に培われた国際協力や外交能力が高く評価されました。内閣府の報道官は、加藤氏の任命について、「彼の宇宙での経験は、地球外の環境での協力と対話の重要性を理解する上で貴重なものであり、日本の外交政策に新たな展望をもたらすでしょう」とコメントしました。

加藤氏自身も、「宇宙から見た地球は、国境や人種の壁を超えた一体性が感じられるものです。私はこの経験を活かし、日本の外交政策の発展に尽力したいと思います」と述べています。

加藤氏の外務大臣就任により、日本の外交政策がよりダイナミックで先進的な方向へ進むことが期待されています。"""
x, sr = pyopenjtalk.tts(text)
wavfile.write("public/output.wav", sr, x.astype(np.int16))
# WAVファイルの再生時間を計算
duration = len(x) / sr
print("WAVファイルの再生時間:", duration, "秒")

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

# 1. 画像の読み込み
image_path = "public/input_image.jpg"
url = "https://visit-chiyoda.tokyo/app/upload/images/img01%282%29.jpg"
#response = requests.get(url)
#image_array = np.frombuffer(response.content, np.uint8)
#image = cv2.imdecode(image_array, cv2.IMREAD_COLOR)
image = cv2.imread(image_path, cv2.IMREAD_COLOR)
cv2.imwrite('public/images/image.jpg',image)
height, width, _ = image.shape

font = cv2.FONT_HERSHEY_SIMPLEX
#font = ImageFont.truetype('ヒラギノ丸ゴ ProN W4.ttc', 24)
font_scale = 5
font_thickness = 10
text_color = (255, 255, 255)  # 白色
text_size = 100#cv2.getTextSize(text, font, font_scale, font_thickness)[0]
text_x = 0 #int((width - text_size) / 2)
text_y = height - text_size*2

# 3. 動画のフレーム生成
frames = []
text_count = int(width/text_size)
print(text_count)
split_text = [text[i:i+text_count] for i in range(0, len(text), text_count)]
#duration = 10  # 動画の長さ（秒）
fps = len(split_text)/duration  # フレームレート

for text_unit in split_text:
    frame = inputJP("Frame", cv2.cvtColor(image, cv2.COLOR_RGB2BGR), text_unit, text_x, text_y, text_size*2, text_color, 0)
    frames.append(frame)

# 4. 動画の生成
output_video_path = "public/output_video.mp4"
audio_clip = AudioFileClip("public/output.wav")
clip = ImageSequenceClip(frames, fps=fps)
clip = clip.set_audio(audio_clip)
clip.write_videofile(output_video_path, codec="libx264")

text_size = width/20
text_x = 0
text_y = text_size
image_with_title = inputJP("Frame", image, text, text_x, text_y, text_size, text_color, 0)
cv2.imwrite('public/images/subtitle.jpg', image_with_title)

print("動画が生成されました:", output_video_path)