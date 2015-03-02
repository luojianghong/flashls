/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */
package org.mangui.basic {

    import flash.display.Sprite;
    import flash.media.Video;
    import org.mangui.adaptive.event.AdaptiveEvent;
    import org.mangui.hls.HLS;

    public class Player extends Sprite {
        private var hls : HLS = null;
        private var video : Video = null;

        public function Player() {
            hls = new HLS();
            hls.stage = this.stage;
            video = new Video(640, 480);
            addChild(video);
            video.x = 0;
            video.y = 0;
            video.smoothing = true;
            video.attachNetStream(hls.stream);
            hls.addEventListener(AdaptiveEvent.MANIFEST_LOADED, manifestHandler);
            hls.load("http://domain.com/hls/m1.m3u8");
        }

        public function manifestHandler(event : AdaptiveEvent) : void {
            hls.stream.play(null, -1);
        };
    }
}
