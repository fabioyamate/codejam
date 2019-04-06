(ns codejam.gcj2016.problem-a
  (:require [clojure.java.io :as io]))

(defn numbers [n]
  (map (partial * n) (rest (range))))

(defn solve [n]
  (if (= n (* n 2))
    "INSOMNIA"
    (loop [xs (numbers n)
           ds #{}]
      (let [ds' (clojure.set/union ds (set (distinct (str (first xs)))))]
        (if (= 10 (count ds'))
          (first xs)
          (recur (rest xs) ds'))))))

(with-open [rdr (io/reader (io/resource "A-large.in"))]
  (->> (line-seq rdr)
       rest
       (map #(Integer/parseInt %))
       (map solve)
       (map-indexed (fn [i v] (str "Case #" (inc i) ": " v)))
       (clojure.string/join "\n")
       (spit "out.txt")))
